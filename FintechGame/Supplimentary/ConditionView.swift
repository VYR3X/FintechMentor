//
//  ConditionView.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit

/// Вью с двумя кнопками прикрепленное к таббару на главном экране выбора продукта
final class ConditionView: UIView {

    private let passButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "pass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private let superLikeButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    private let likeButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black //LightPalette().color(.darkBlue)
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Баланс"
        return label
    }()

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    private func setupView() {
        addSubview(balanceLabel)
        NSLayoutConstraint.activate([
            balanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            balanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
