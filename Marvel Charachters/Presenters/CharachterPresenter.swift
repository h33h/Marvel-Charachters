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
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displayAllCharachters(charachters: response)
            }
        }
    }
    func getCharachtersByNameStartsWith(nameStartsWith: String) {
        charachterService.getCharachtersByName(nameStartsWith: nameStartsWith) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByFullName(name: String) {
        charachterService.getCharachterByFullName(name: name) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByFilter(filter: CharachterFilter) {
        charachterService.getCharachtersByFilter(filter: filter) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByModifiedSince(date: String) {
        charachterService.getCharachtersModifiedSince(date: date) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByComicsID(id: Int) {
        charachterService.getCharachtersByComicsID(id: id) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersBySeriesID(id: Int) {
        charachterService.getCharachtersBySeriesID(id: id) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByStoriesID(id: Int) {
        charachterService.getCharachtersByStoriesID(id: id) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
    func getCharachtersByEventsID(id: Int) {
        charachterService.getCharachtersByEventsID(id: id) { [weak self] data, response, _ in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            let response = try? jsonDecoder.decode(CharacterDataWrapper.self, from: data)
            if let response = response?.data?.results {
                self?.charachterDelegate?.displaySelectedCharachter(charachters: response)
            }
        }
    }
}
