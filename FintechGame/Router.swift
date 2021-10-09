//
//  Router.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit
import PopBounceButton
import Shuffle_iOS

final class Router {
    
    // Количество экранов внутри флоу BuySell
    static var buySellFlowCount = 0
    // Заработанные очки игрока
    static var resultCount = 0
    // Стартовый баланс
    static var userBalance = 1000
    
    static var flowCount = 0
    
    static let networkManager = NetworkManager()
    
    static var cardModel: [TinderCardModel] = []
    
    static let vc = TinderViewController()
    
    static let array: [[Int]] = [
        [13, 23, 15, 17, 19, 31, 23, 15, 16, 14, 17, 23],
        [11, 17, 32, 25, 24, 10, 15, 21, 16, 14, 17, 23],
        [23, 10, 18, 11, 15, 10, 13, 12, 15, 17, 11, 23]
    ]
    
    static func createBuySellViewController(with model: Stock) -> UIViewController {
        let vc = BuySellViewController()
        vc.model = model
        vc.navigationTitle = "Сценарий: \(buySellFlowCount + 1)"
        vc.stockData = array[buySellFlowCount]
        buySellFlowCount += 1
        return vc
    }
    
    static func createTinderCard() -> UIViewController {
        if flowCount == 0 {
            cardModel.append(TinderCardModel(name: "Apple",
                                             header: "Глава компании Apple Тим\nКук подписал договор о разработке электромобилей на базе Hunday Solaris", text: "BBC",
                                             image: UIImage(named: "image1"),
                                             character: nil,
                                             balance: 1000,
                                             values: [13, 23, 15, 17, 19, 31, 23, 15, 16, 14, 17, 23],
                                             link: nil))
            
            vc.cardModels = cardModel
        }
        flowCount += 1
        return vc
    }
        
    // Обучение в развлекательном формате 
    static func createFunViewController() -> UIViewController {
        let vc = ScrollViewController() //FunViewController()
        return vc
    }
}
