//
//  ViewController.swift
//  FintechGame
//
//  Created by v.zhokhov on 07.10.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    var router: FlowAssembly? = nil
    
    let manager = NetworkManager()
    
    var model: Stock? = nil

    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.text = "Добрый день\n\nЕсли вы готовы начать играть то нажмите кнопку Игра"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Игра",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(self.tappedNext))
        setup()
        
//        manager.getCurrencyesJson { result in
//            switch result {
//            case .success(let model):
//                self.model = model
//                print("G: \(model)")
//            case .failure(let error):
//                print("G: \(error)")
//            }
//        }
    }
    
    private func setup() {
        view.addSubview(welcomeLabel)
//        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        welcomeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        welcomeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    @objc private func addTapped() {
        let viewController = Router.createBuySellViewController(with: model!)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func tappedNext() {
        let viewController = Router.createTinderCard()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
//    @objc private func nextTap() {
//        let viewController = router?.createBuySellViewController()
//        navigationController?.pushViewController(viewController!, animated: true)
//    }
}
