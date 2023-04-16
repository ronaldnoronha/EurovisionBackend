//
//  CreateRepresentations.swift
//  
//
//  Created by Noronha, Ronald on 15/4/2023.
//

import Fluent

struct CreateRepresentations: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("representations")
            .id()
            .field("delegate", .string, .required)
            .field("country", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("representations").delete()
    }
}
