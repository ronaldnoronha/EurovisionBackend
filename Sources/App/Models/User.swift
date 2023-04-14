//
//  File.swift
//  
//
//  Created by Noronha, Ronald on 14/4/2023.
//

import Fluent
import Vapor

final class User: Model, Content {        
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "password")
    var password: String
    
    init() {}
    
    init(id: UUID? = nil, name: String, password: String) {
        self.id = id
        self.name = name
        self.password = password
    }
}

