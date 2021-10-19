//
//  ImageProxy.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

let imageCache = NSCache<NSString, NSData>()

class ImageProxy: LoadImageServiceProtocol {
    private let imageService: LoadImageServiceProtocol
    
    init(service: LoadImageServiceProtocol) {
        self.imageService = service
    }
    
    func laodImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return completion(cachedImage as Data, nil, nil)
        }
        imageService.laodImage(url: url) { data, response, error in
            guard let data = data else {
                return completion(nil, response, error)
            }
            imageCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            completion(data, response, error)
        }
    }
}
