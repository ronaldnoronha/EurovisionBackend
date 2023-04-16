import Fluent
import Vapor

func routes(_ app: Application) throws {
    // /login?name=ron&password=hey
//    app.get("login") { req async throws in
//        let user = try req.query.decode(User.self)
//        
//        if user.name != "ron" {
//            throw Abort(.badRequest, reason: "No user found")
//        }
//
//        if user.password != "hey" {
//            throw Abort(.badRequest, reason: "Incorrect password")
//        }
//        
//        return "user \(user.name) and password \(user.password)"
//    }
    
    
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
    
    // /submit/name
    
//    app.post("submit",*)
    
    //
    
    
    try app.register(collection: TodoController())
}
