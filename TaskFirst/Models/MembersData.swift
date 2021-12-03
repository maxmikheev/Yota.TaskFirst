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
/*
class DetailDescriptions {
    let birthday: String
}

init
*/

let birhday = "01.01.1970"
let date = ["01.01.2000","01.01.3000","01.01.4000"]
