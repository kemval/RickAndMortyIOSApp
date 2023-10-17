//
//  RMGetLocationsResponse.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 28/9/23.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMLocation]
}
