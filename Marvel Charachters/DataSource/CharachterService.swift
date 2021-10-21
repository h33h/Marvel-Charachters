//
//  CharachterService.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation
import Alamofire

enum HeroFilter {
    case noSorted
    case nameStartsWith(String)
    case fullName(String)
    case filter(CharachterFilter)
    case modifiedSince(String)
    case comicsID(Int)
    case seriesID(Int)
    case eventsID(Int)
    case storiesID(Int)
}

class CharachterService {
    private var requestBuider = RequestBuilder()
    private func getCharachters(offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersByName(nameStartsWith: String, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchByNameStartsWith(nameStartsWith: nameStartsWith)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachterByFullName(name: String, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchByFullName(name: name)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersByFilter(filter: CharachterFilter,
                                        offset: Int,
                                        limit: Int,
                                        completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addFilter(filter: filter)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersModifiedSince(date: String, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addModifiedSince(date: date)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersByComicsID(id: Int, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchByComicsId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersBySeriesID(id: Int, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchBySeriesId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersByEventsID(id: Int, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchByEventsId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    private func getCharachtersByStoriesID(id: Int, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        requestBuider.addSearchByStoriesId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil) }
        AF.request(url).responseJSON(completionHandler: completion)
    }
    func invokeGetCharachter(type: HeroFilter, offset: Int, limit: Int, completion: @escaping (AFDataResponse<Any>?) -> Void) {
        switch type {
        case .noSorted:
            getCharachters(offset: offset, limit: limit, completion: completion)
        case .nameStartsWith(let string):
            getCharachtersByName(nameStartsWith: string, offset: offset, limit: limit, completion: completion)
        case .fullName(let string):
            getCharachterByFullName(name: string, offset: offset, limit: limit, completion: completion)
        case .filter(let charachterFilter):
            getCharachtersByFilter(filter: charachterFilter, offset: offset, limit: limit, completion: completion)
        case .modifiedSince(let string):
            getCharachtersModifiedSince(date: string, offset: offset, limit: limit, completion: completion)
        case .comicsID(let int):
            getCharachtersByComicsID(id: int, offset: offset, limit: limit, completion: completion)
        case .seriesID(let int):
            getCharachtersBySeriesID(id: int, offset: offset, limit: limit, completion: completion)
        case .eventsID(let int):
            getCharachtersByEventsID(id: int, offset: offset, limit: limit, completion: completion)
        case .storiesID(let int):
            getCharachtersByStoriesID(id: int, offset: offset, limit: limit, completion: completion)
        }
    }
}
