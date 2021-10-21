//
//  EventSummary.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct EventSummary: Codable, SummaryProtocol {
    var resourceURI: String? // The path to the individual event resource.,
    var name: String? // The name of the event.
}
