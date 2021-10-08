//
//  StockModel.swift
//  FintechGame
//
//  Created by v.zhokhov on 07.10.2021.
//

import Foundation

struct StockModel: Codable, Hashable, Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let imageName: String
    let category: String
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName
        case category
        case job
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(category)
        hasher.combine(job)
    }
}

