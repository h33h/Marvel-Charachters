//
//  Image.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct Image: Codable {
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    var path: String? // The directory path of to the image.,
    var ext: String? // The file extension for the image.
    func getImageUrl() -> URL? {
       URL(string: ((path ?? "") + "." + (ext ?? "")))
    }
}
