//
//  LoadServiceProtocol.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

protocol LoadImageServiceProtocol {
    func laodImage (url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
