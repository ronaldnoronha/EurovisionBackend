//
//  CreateVotes.swift
//  
//
//  Created by Noronha, Ronald on 17/4/2023.
//

import Fluent

struct CreateVotes: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("votes")
            .id()
            .field("delegate", .string, .required)
            .field("country", .string, .required)
            .field("points12", .string, .required)
            .field("points10", .string, .required)
            .field("points8", .string, .required)
            .field("points7", .string, .required)
            .field("points6", .string, .required)
            .field("points5", .string, .required)
            .field("points4", .string, .required)
            .field("points3", .string, .required)
            .field("points2", .string, .required)
            .field("points1", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("votes").delete()
    }
}
