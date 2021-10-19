//
//  CharachterPresenter.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

protocol CharachterViewDelegate: AnyObject {
    func displayAllCharachters(charachters: [Charachter])
    func displaySelectedCharachter(charachter: Charachter)
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
    func getAllCharachters(limit: Int) {
        charachterService.getCharachters(limit: limit) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharachterResponse.self, from: data)
            if let response = response {
            self?.charachterDelegate?.displayAllCharachters(charachters: response.data.results)
            }
        }
    }
    func getSelectedCharachter(id: Int) {
        charachterService.getCharachterByID(id: id) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharachterResponse.self, from: data)
            if let response = response {
                guard let char = response.data.results.first else { return }
                self?.charachterDelegate?.displaySelectedCharachter(charachter: char)
            }
        }
    }
}
