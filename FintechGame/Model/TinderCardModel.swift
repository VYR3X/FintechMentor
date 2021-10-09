//
//  TinderCardModel.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit

/// Модель для карточки 
struct TinderCardModel {
    let name: String
    let header: String
    let text: String
    let image: UIImage?
    let character: String?
    let balance: UInt
    let values: [Int]
    let link: String?
}
