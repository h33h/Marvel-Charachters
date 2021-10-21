//
//  LoadImageService.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation
import Alamofire

class LoadImageService: LoadImageServiceProtocol {
    func laodImage(url: URL, completion: @escaping (Data?) -> Void) {
        AF.request(url).response { response in
            if let response = response.data {
                completion(response)
            }
        }
    }
}
