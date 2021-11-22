//
//  MembersData.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

struct Team {
    let comrad: String
    let work: String
}

extension Team {
    static func teamMembers() -> [Team] {
        [
            Team(comrad: "Максим Линьков", work: "ios"),
            Team(comrad: "Максим Новиков", work: "android"),
            Team(comrad: "Максим Михеев", work: "qa")
        ]
    }
}
