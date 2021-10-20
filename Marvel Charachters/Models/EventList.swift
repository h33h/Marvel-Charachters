//
//  EventList.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct EventList: Codable {
    var available: Int? // The number of total available events in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int? // The number of events returned in this collection (up to 20).,
    var collectionURI: String? // The path to the full list of events in this collection.,
    var items: [EventSummary]? // The list of returned events in this collection.
}
