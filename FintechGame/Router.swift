//
//  Router.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit

final class Router {
    
    // Количество экранов внутри флоу BuySell
    static var buySellFlowCount = 0
    // Заработанные очки игрока
    static var resultCount = 0
    // Стартовый баланс
    static var userBalance = 1000
    
    static let networkManager = NetworkManager()
    
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
    
    
    static func createFirstFourCard() -> UIViewController {
        let cardModels = [
            TinderCardModel(name: "Глава компании Apple Тим\nКук подписал договор о разработке электромобилей на базе Hunday Solaris",
                            age: 26,
                            occupation: "Apple Inc",
                            image: UIImage(named: "image1")),
            TinderCardModel(name: "Глава компании Apple Тим\nКук подписал договор о разработке электромобилей на базе Hunday Solaris",
                            age: 27,
                            occupation: "Amazon",
                            image: UIImage(named: "image2")),
            TinderCardModel(name: "Глава компании Apple Тим\nКук подписал договор о разработке электромобилей на базе Hunday Solaris",
                            age: 23,
                            occupation: "VTB",
                            image: UIImage(named: "image3")),
            TinderCardModel(name: "Глава компании Apple Тим\nКук подписал договор о разработке электромобилей на базе Hunday Solaris",
                            age: 25,
                            occupation: "Google",
                            image: UIImage(named: "image1"))
        ]
        
        networkManager.fetchTeachCards { retult in
            switch retult {
            case .success(let result):
                print("Result: \(result)")
            case .failure(let error):
                print("Result: \(error)")
            }
        }
        
        let vc = TinderViewController()
        vc.cardModels = cardModels
        return vc
    }
    
    // Обучение в развлекательном формате 
    static func createFunViewController() -> UIViewController {
        let vc = FunViewController()
        return vc
    }
}
