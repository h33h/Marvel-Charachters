//
//  RequestBuilder.swift
//  Marvel Charachters
//
//  Created by XXX on 19.10.21.
//

import Foundation
import CommonCrypto

enum CharachterFilter: String {
    case name
    case nameDescending = "-name"
    case modified
    case modifiedDescending = "-modified"
}

class RequestBuilder {
    private var url: String = "https://gateway.marvel.com:443/v1/public/characters?"
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
    func addFilter(filter: CharachterFilter) {
        url += "&orderBy=\(filter.rawValue)"
    }
    func addSearchByFullName(name: String) {
        url += "&name=\(name)"
    }
    func addSearchByNameStartsWith(nameStartsWith: String) {
        url += "&nameStartsWith=\(nameStartsWith)"
    }
    func addModifiedSince(date: String) {
        url += "&modifiedSince=\(date)"
    }
    func addLimit(limit: Int) {
        url += "&limit=\(limit)"
    }
    func addOffset(offset: Int) {
        url += "&offset=\(offset)"
    }
    func addSearchByComicsId(id: Int) {
        url += "&comics=\(id)"
    }
    func addSearchBySeriesId(id: Int) {
        url += "&series=\(id)"
    }
    func addSearchByEventsId(id: Int) {
        url += "&events=\(id)"
    }
    func addSearchByStoriesId(id: Int) {
        url += "&stories=\(id)"
    }
    private func addTrailingKeys() {
        url += "&ts=\(self.ts)&apikey=\(self.publicKey)&hash=\(self.md5)"
    }
    func getUrl() -> URL? {
        addTrailingKeys()
        let temp = URL(string: url)
        url = "https://gateway.marvel.com:443/v1/public/characters?"
        return temp
    }
}
