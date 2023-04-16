//
//  File.swift
//  
//
//  Created by Noronha, Ronald on 14/4/2023.
//

import Fluent
import Vapor

final class Representation: Model, Content {
    static let schema = "representations"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "delegate")
    var delegate: String
    
    @Field(key: "country")
    var country: String
    
    init() {}
    
    init(id: UUID? = nil, delegate: String, country: String) {
        self.id = id
        self.delegate = delegate
        self.country = country
    }
}
