import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // /login?name=ron&password=hey
    
    app.get("login") { req async throws in
        let user = try req.query.decode(User.self)

        if user.name != "ron" {
            throw Abort(.badRequest, reason: "No user found")
        }

        if user.password != "hey" {
            throw Abort(.badRequest, reason: "Incorrect password")
        }
        
        return "user \(user.name) and password \(user.password)"
    }
    
    
    // /signup
    app.post("signup") { req async throws in
        let user = try req.content.decode(User.self)
        
        // TODO: - check in database if the name already exists
        if user.name == "harish" {
            throw Abort(.badRequest, reason: "User already exists")
        }
        
        // TODO: - Add to DB
        
        return HTTPStatus.ok
    }
    
    try app.register(collection: TodoController())
}
