////
////  Stubs.swift
////  FintechGame
////
////  Created by v.zhokhov on 07.10.2021.
////
//
//import Foundation
//
//extension StockModel {
//
//    static let ff7Stubs: [StockModel] = {
//        guard let items: [StockModel] = try? Bundle.main.loadAndDecodeJSON(filename: "stocks", keyDecodingStrategy: .convertFromSnakeCase) else {
//            return []
//        }
//        return items
//    }()
//
//    static let marvelStubs: [StockModel] = {
//        guard let items: [StockModel] = try? Bundle.main.loadAndDecodeJSON(filename: "marvel", keyDecodingStrategy: .convertFromSnakeCase) else {
//            return []
//        }
//        return items
//    }()
//
//    static let dcStubs: [StockModel] = {
//        guard let items: [StockModel] = try? Bundle.main.loadAndDecodeJSON(filename: "dc", keyDecodingStrategy: .convertFromSnakeCase) else {
//            return []
//        }
//        return items
//    }()
//
//    static let starWarsStubs: [StockModel] = {
//        guard let items: [StockModel] = try? Bundle.main.loadAndDecodeJSON(filename: "starwars", keyDecodingStrategy: .convertFromSnakeCase) else {
//            return []
//        }
//        return items
//    }()
//
//
//    func loadAndDecodeJSON<D: Decodable>(filename: String,
//                                         keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> D {
//        guard
//            let url = url(forResource: filename, withExtension: "json")
//        else {
//            throw NSError(domain: "", code: NSFileNoSuchFileError, userInfo: [NSLocalizedDescriptionKey: "file not found"])
//        }
//        let data = try Data(contentsOf: url)
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
//
//        let decodedModel = try jsonDecoder.decode(D.self, from: data)
//        return decodedModel
//    }
//}
