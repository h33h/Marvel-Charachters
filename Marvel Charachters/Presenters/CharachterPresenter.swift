//
//  CharachterPresenter.swift
//  Marvel Charachters
//
//  Created by XXX on 18.10.21.
//

import Foundation

protocol CharachterViewDelegate: AnyObject {
    func displayAllCharachters(charachters: [Charachter])
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
    func getCharachtersBy(filter: HeroFilter, offset: Int = 0, limit: Int = 20) {
        charachterService.invokeGetCharachter(type: filter, offset: offset, limit: limit) { [weak self] data in
            guard let data = data?.data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displayAllCharachters(charachters: response)
            }
        }
    }
}
