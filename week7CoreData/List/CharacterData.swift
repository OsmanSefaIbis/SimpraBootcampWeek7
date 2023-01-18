//
//  CharacterData.swift
//  week7CoreData
//
//  Created by Sefa İbiş on 17.01.2023.
//

import Foundation

struct ApiData: Decodable{
    let results: [CharacterData]?
}
struct CharacterData: Decodable{
    let name, status, gender: String?
    let image: String?
}
