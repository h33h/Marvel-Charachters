//
//  StorySummary.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct StorySummary: Codable, SummaryProtocol {
    var resourceURI: String? // The path to the individual story resource.,
    var name: String? // The canonical name of the story.,
    var type: String? // The type of the story (interior or cover).
}
