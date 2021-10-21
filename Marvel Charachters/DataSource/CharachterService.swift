//
//  CharachterService.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

class CharachterService {
    private var requestBuider = RequestBuilder()
    func getCharachters(offset: Int, limit: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addOffset(offset: offset)
        requestBuider.addLimit(limit: limit)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersByName(nameStartsWith: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchByNameStartsWith(nameStartsWith: nameStartsWith)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachterByFullName(name: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchByFullName(name: name)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersByFilter(filter: CharachterFilter, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addFilter(filter: filter)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersModifiedSince(date: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addModifiedSince(date: date)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersByComicsID(id: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchByComicsId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersBySeriesID(id: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchBySeriesId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersByEventsID(id: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchByEventsId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachtersByStoriesID(id: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestBuider.addSearchByStoriesId(id: id)
        guard let url = requestBuider.getUrl() else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
}
