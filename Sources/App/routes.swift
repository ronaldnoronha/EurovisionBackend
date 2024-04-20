import Fluent
import Vapor

struct Votes: Content {
    let votes: [Vote]
}

struct RepresentationResponse: Content {
    let country: String
    let delegate: String
    let hasVoted: Bool
    let vote: Vote?
    let songs: [Song]
}

struct HasVotedRequest: Content {
    let country: String
}

struct HasVotedResponse: Content {
    let hasVoted: Bool
}

struct DeleteRequest: Content {
    let delegate: String
}

func routes(_ app: Application) throws {
    // /ping
    app.get("ping") { _ in
        return "Eurovision pong"
    }
    
    // /login?name=ron&password=hey
    app.get("login") { req async throws in
        let user = try req.query.decode(User.self)
        
        guard let userDb = try await User.query(on: req.db)
            .filter(\.$name==user.name)
            .first(),
              userDb.password == user.password else {
            throw Abort(.badRequest, reason: "Wrong details")
        }
        
        guard let representation = try await Representation.query(on: req.db)
            .filter(\.$delegate==user.name)
            .first()
        else {
            throw Abort(.badRequest, reason: "No country allocated, talk to admin")
        }
    
        let hasVoted: Bool
        if try await Vote.query(on: req.db)
            .filter(\.$country==representation.country)
            .count() > 0 {
            hasVoted = true
        } else {
            hasVoted = false
        } 
        
        let votes: Vote? = hasVoted ? try await Vote.query(on: req.db)
            .filter(\.$country==representation.country)
            .first() : nil
        
        return RepresentationResponse(
            country: representation.country,
            delegate: user.name,
            hasVoted: hasVoted,
            vote: votes,
            songs: getSongEntries(country: representation.country)
        )
    }
        
    // /signup
    app.post("signup") { req async throws in
        if stopVoting {
            throw Abort(.badRequest, reason: "Voting has stopped")
        }
        
        let user = try req.content.decode(User.self)
        
        if try await User.query(on: req.db)
            .filter(\.$name==user.name)
            .count() > 0 {
            throw Abort(.badRequest, reason: "User already exists")
        }
        
        try await user.save(on: req.db)
        
        var occurences = true
        var country: String
        repeat {
            country = participants.randomElement()!
            occurences = try await Representation.query(on: req.db)
                .filter(\.$country==country)
                .count() > 0
        } while (occurences)


        let representation = Representation(delegate: user.name, country: country)
        
        try await representation.save(on: req.db)
        
        return RepresentationResponse(
            country: representation.country,
            delegate: user.name,
            hasVoted: false,
            vote: nil,
            songs: getSongEntries(country: representation.country)
        )
    }
    
    // /submit
    app.post("submit") { req async throws in
        if stopVoting {
            throw Abort(.badRequest, reason: "Voting has stopped")
        }
        
        let vote = try req.content.decode(Vote.self)
        
        if try await Vote.query(on: req.db)
            .filter(\.$delegate==vote.delegate)
            .count() > 0 {
            throw Abort(.badRequest, reason: "Already Voted")
        }
        
        try await vote.save(on: req.db)
        
        return HTTPStatus.ok
    }
    
    // /votes
    app.get("votes") { req async throws -> Votes in
        let votes = try await Vote.query(on: req.db)
            .all()
        
        return Votes(votes: votes)
    }

    try app.register(collection: TodoController())
    
    // /hasVoted?country=australia
    app.get("hasVoted") { req async throws -> HasVotedResponse in
        let request = try req.query.decode(HasVotedRequest.self)
        
        if try await Vote.query(on: req.db)
            .filter(\.$country==request.country)
            .count() > 0 {
            return HasVotedResponse(hasVoted: true)
        } else {
            return HasVotedResponse(hasVoted: false)
        }
    }
    
    // /getVotes?country=australia
    app.get("getVotes") { req async throws -> Vote in
        let request = try req.query.decode(HasVotedRequest.self)
        
        guard let vote = try await Vote.query(on: req.db)
            .filter(\.$country==request.country)
            .first()
        else {
            throw Abort(.badRequest, reason: "No recorded votes for the delegate")
        }
        
        return vote
    }
    
    // /delete?delegate=ron
    app.get("delete") { req async throws -> Votes in
        if stopVoting {
            throw Abort(.badRequest, reason: "Voting has stopped")
        }
        
        let request = try req.query.decode(DeleteRequest.self)
        
        guard let vote = try await Vote.query(on: req.db)
            .filter(\.$delegate==request.delegate)
            .first()
        else {
            throw Abort(.badRequest, reason: "No recorded votes for the delegate")
        }
        
        try await vote.delete(on: req.db)
        
        return Votes(votes: try await Vote.query(on: req.db)
            .all())
    }
    
    // /stop
    app.get("stop") { req async throws in
        stopVoting = true
        return HTTPStatus.ok
    }
    
    // /reversestop
    app.get("reversestop") { req async throws in
        stopVoting = false
        return HTTPStatus.ok
    }
}
