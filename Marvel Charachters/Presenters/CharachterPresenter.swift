//
//  CharachterPresenter.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

protocol CharachterViewDelegate: AnyObject {
    func displayAllCharachters(charachters: [Charachter])
    func displaySelectedCharachter(charachters: [Charachter])
}
class CharachterPresenter {
    private let charachterService: CharachterService
    private weak var charachterDelegate: CharachterViewDelegate?
    init(charachterService: CharachterService) {
        self.charachterService = charachterService
    }
    func setViewDelegate(charachterViewDelegate: CharachterViewDelegate?) {
        self.charachterDelegate = charachterViewDelegate
    }
    func getMoreCharachters(offset: Int, limit: Int) {
        charachterService.getCharachters(offset: offset, limit: limit) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharachterResponse.self, from: data)
            if let response = response {
            self?.charachterDelegate?.displayAllCharachters(charachters: response.data.results)
            }
        }
    }
    func getSelectedCharachter(nameStartsWith: String) {
        charachterService.getCharachterByName(nameStartsWith: nameStartsWith) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharachterResponse.self, from: data)
            if let response = response {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response.data.results)
            }
        }
    }
}
