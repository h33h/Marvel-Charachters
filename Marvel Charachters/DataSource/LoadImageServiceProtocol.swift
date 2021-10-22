//
//  LoadServiceProtocol.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation
import Alamofire

protocol LoadImageServiceProtocol {
    func loadImage (url: URL, completion: @escaping (Data?) -> Void)
}
