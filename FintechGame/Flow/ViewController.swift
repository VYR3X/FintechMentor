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

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
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
        navigationController?.navigationBar.barTintColor = .systemTeal
        setup()
    }
    
    private func setup() {
        view.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        let viewController = Router.createTinderCard()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
