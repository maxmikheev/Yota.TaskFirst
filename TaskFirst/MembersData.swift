//
//  MembersData.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

struct Teammates {
    let comrad: String
    let work: String
}

extension Teammates {
    static func teamMembers() -> [Teammates] {
        [
            Teammates(comrad: "Максим Линьков", work: "ios"),
            Teammates(comrad: "Максим Новиков", work: "android"),
            Teammates(comrad: "Максим Михеев", work: "qa")
        ]
    }
}

struct DetailDescriptions {
    let birthday: String
}

extension DetailDescriptions {
    static func detailOfMembers() -> [DetailDescriptions] {
        [
            DetailDescriptions(birthday: "01.01.1970")
        ]
    }
}
