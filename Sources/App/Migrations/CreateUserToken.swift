//
//  CreateUserToken.swift
//  OinkosWebServer
//
//  Created by Sam Nascimento on 17/11/24.
//

import Fluent

struct CreateUserToken: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(UserToken.schema)
            .id()
            .field("user_id", .uuid, .required, .references("user", "id"))
            .field("token", .string, .required)
            .unique(on: "token")
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(UserToken.schema).delete()
    }
}