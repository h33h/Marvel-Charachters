//
//  StoryList.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation

struct StoryList: Codable {
    var available: Int? // The number of total available stories in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int? // The number of stories returned in this collection (up to 20).,
    var collectionURI: String? // The path to the full list of stories in this collection.,
    var items: [StorySummary]? // The list of returned stories in this collection.
}
