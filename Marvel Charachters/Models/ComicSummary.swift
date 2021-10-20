//
//  ComicSummary.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct ComicSummary: Codable, SummaryProtocol {
    var resourceURI: String? // The path to the individual comic resource.,
    var name: String? // The canonical name of the comic.
}
