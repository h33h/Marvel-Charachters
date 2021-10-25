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
    private var imageUrl: URL?
    init(service: LoadImageServiceProtocol) {
        self.imageService = service
        self.imageUrl = nil
    }
    func loadImage(url: URL, completion: @escaping (Data?) -> Void) {
        imageUrl = url
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return completion(cachedImage as Data)
        }
        imageService.loadImage(url: url) { data in
            guard let data = data else {
                return completion(nil)
            }
            imageCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            guard self.imageUrl == url else { return completion(nil) }
                    completion(data)
        }
    }
}
