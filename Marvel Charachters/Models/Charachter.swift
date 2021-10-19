//
//  Charachter.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

struct CharachterResponse: Codable {
    struct CharacterDataContainer: Codable {
        var results: [Charachter]
    }
    var data: CharacterDataContainer
}

struct CharachterImage: Codable {
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    var path: String
    var ext: String
    func getImageUrl() -> URL? {
        URL(string: self.path + "." + self.ext)
    }
}

struct Charachter: Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: CharachterImage
}
