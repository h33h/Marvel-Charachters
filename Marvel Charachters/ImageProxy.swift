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
    func laodImage(url: URL, completion: @escaping (Data?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return completion(cachedImage as Data)
        }
        imageService.laodImage(url: url) { data in
            guard let data = data else {
                return completion(nil)
            }
            imageCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            completion(data)
        }
    }
}
