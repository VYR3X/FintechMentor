//
//  FlowAssembly.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit

final class FlowAssembly {
    var count = 0
}

extension FlowAssembly {
    func createWelcomeViewController() -> UIViewController {
        let vc = ViewController()
        vc.router = self
        return vc
    }
    
    func createBuySellViewController(with model: Stock) -> UIViewController {
        let vc = BuySellViewController()
        vc.model = model
        count += 0
//        vc.router = self
//        vc.navigationTitle = "Сценарий: \(count)"
        return vc
    }
}
