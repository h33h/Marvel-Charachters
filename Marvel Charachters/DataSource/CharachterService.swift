//
//  CharachterService.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation
import CommonCrypto

class CharachterService {
    private var publicKey = "99d4794a0f960ff529e2a6f15be77af6"
    private var privateKey = "5d2fd52deed3922d5de8eb287d1f5506151dec8a"
    private var ts = "1"
    private var md5: String {
        let data = Data((ts + privateKey + publicKey).utf8)
            let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
                var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
                CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
                return hash
            }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    func getAllCharachtersURL(offset: Int, limit: Int) -> URL? {
        URL(string: "https://gateway.marvel.com:443/v1/public/characters?offset=\(offset)&limit=\(limit)&ts=\(ts)&apikey=\(publicKey)&hash=\(md5)")
    }
    func getCharachterByNameURL(nameStartsWith: String) -> URL? {
        URL(string: "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(nameStartsWith)&ts=\(ts)&apikey=\(publicKey)&hash=\(md5)")
    }
    func getCharachters(offset: Int, limit: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = getAllCharachtersURL(offset: offset, limit: limit) else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
    func getCharachterByName(nameStartsWith: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = getCharachterByNameURL(nameStartsWith: nameStartsWith) else { return completion(nil, nil, nil) }
        let session = URLSession.shared.dataTask(with: url, completionHandler: completion)
        session.resume()
    }
}
