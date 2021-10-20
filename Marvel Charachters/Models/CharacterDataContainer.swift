//
//  CharacterDataContainer.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct CharacterDataContainer: Codable {
    var offset: Int? // The requested offset (number of skipped results) of the call.,
    var limit: Int? // The requested result limit.,
    var total: Int? // The total number of resources available given the current filter set.,
    var count: Int? // The total number of results returned by this call.,
    var results: [Charachter]? // The list of characters returned by the call.
}
