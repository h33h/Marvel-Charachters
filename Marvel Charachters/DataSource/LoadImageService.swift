//
//  LoadImageService.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

class LoadImageService: LoadImageServiceProtocol {
    func laodImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: sessionConfiguration)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
