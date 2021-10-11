//
//  TinderCardModel.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit
import Foundation

/// Вью модель для отображения на экране
struct TinderCardViewModel {
    let name: String
    let header: String
    let text: String
    let image: UIImage?
    let character: String?
    let balance: UInt
    let values: [Int]
    let link: String?
}

/// Модель данных с бека
struct TinderModel: Codable {
    let type: String
    let header: String
    let text: String
    let character: String?
    let balance: UInt
    let values: [Int]
    let link: String?
}



extension TinderModel {

    static let linkCard: TinderModel? = {
        guard let item: TinderModel = try? Bundle.main.loadAndDecodeJSON(filename: "linkCard",
                                                                         keyDecodingStrategy: .convertFromSnakeCase) else {
            return nil
        }
        return item
    }()

    static let defaultCard: TinderModel? = {
        guard let item: TinderModel = try? Bundle.main.loadAndDecodeJSON(filename: "defaultCard",
                                                                         keyDecodingStrategy: .convertFromSnakeCase) else {
            return nil
        }
        return item
    }()
    
    static let mentorCard: TinderModel? = {
        guard let item: TinderModel = try? Bundle.main.loadAndDecodeJSON(filename: "mentorCard",
                                                                         keyDecodingStrategy: .convertFromSnakeCase) else {
            return nil
        }
        return item
    }()
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String,
                                         keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> D {
        
        guard let url = url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "", code: NSFileNoSuchFileError, userInfo: [NSLocalizedDescriptionKey: "file not found"])
        }
        
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
        
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
    
}
