import Fluent
import Vapor

struct Votes: Content {
    let votes: [Vote]
}


func routes(_ app: Application) throws {
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
        
        return representation.country
    }
        
    // /signup
    app.post("signup") { req async throws in
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
        
        return representation
    }
    
    // /submit
    app.post("submit") { req async throws in
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
}
