//
//  AppleModel.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import Foundation

// MARK: - Stock

struct Stock: Codable {
    let testList: [TestList]

    enum CodingKeys: String, CodingKey {
        case testList = "test_list"
    }
}

// MARK: - TestList

struct TestList: Codable {
    let text: String
    let options: [String]
    let dots: [Int]
    let testListRight, explainRight, explainWrong: String

    enum CodingKeys: String, CodingKey {
        case text, options, dots
        case testListRight = "right"
        case explainRight = "explain_right"
        case explainWrong = "explain_wrong"
    }
}

