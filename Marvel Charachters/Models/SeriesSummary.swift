//
//  SeriesSummary.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct SeriesSummary: Codable, SummaryProtocol {
    var resourceURI: String? // The path to the individual series resource.,
    var name: String? // The canonical name of the series.
}
