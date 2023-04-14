//
//  File.swift
//  
//
//  Created by Noronha, Ronald on 14/4/2023.
//

import Fluent
import Vapor

final class Vote: Model, Content {
    static let schema = "votes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "delegate")
    var delegate: String
    
    @Field(key: "country")
    var country: String
    
    @Field(key: "point12")
    var points12: String
    
    @Field(key: "point10")
    var points10: String
    
    @Field(key: "point8")
    var points8: String
    
    @Field(key: "point7")
    var points7: String
    
    @Field(key: "point6")
    var points6: String
    
    @Field(key: "point5")
    var points5: String
    
    @Field(key: "point4")
    var points4: String
    
    @Field(key: "point3")
    var points3: String
    
    @Field(key: "point2")
    var points2: String
    
    @Field(key: "point1")
    var points1: String
    
    init() {}
    
    init(
        id: UUID? = nil,
        delegate: String,
        country: String,
        points12: String,
        points10: String,
        points8: String,
        points7: String,
        points6: String,
        points5: String,
        points4: String,
        points3: String,
        points2: String,
        points1: String
    ) {
        self.id = id
        self.delegate = delegate
        self.country = country
        self.points12 = points12
        self.points10 = points10
        self.points8 = points8
        self.points7 = points7
        self.points6 = points6
        self.points5 = points5
        self.points4 = points4
        self.points3 = points3
        self.points2 = points2
        self.points1 = points1
    }
}
