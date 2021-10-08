//
//  MultipleView.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit

/// Протокол делегата для управления multiple view
protocol MultipleViewDelegate: NSObject {
    /// Обработчик левой кнопки
    func leftButtonHandler()
    /// Обработчик правой кнопки
    func rightButtonHandler()
}

/// Вью с двумя кнопками прикрепленное к таббару на главном экране выбора продукта
final class MultipleView: UIView {

    weak var delegate: MultipleViewDelegate?

    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 5
        button.addTarget(self, action: #selector(tapOnLeftButton(sender:)), for: .touchUpInside)
        return button
    }()

    /// Лейбл левой кнопки
    let leftButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .blue //LightPalette().color(.darkBlue)
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 5
        button.addTarget(self, action: #selector(tapOnRightButton(sender:)), for: .touchUpInside)
        return button
    }()

    /// Лейбл правой кнопки
    let rightButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .blue //LightPalette().color(.darkBlue)
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private let modelInfoStaskView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 25
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    private func setupView() {
        leftButton.addSubview(leftButtonLabel)
        rightButton.addSubview(rightButtonLabel)
        
        modelInfoStaskView.addArrangedSubview(leftButton)
        modelInfoStaskView.addArrangedSubview(rightButton)
        
        addSubview(modelInfoStaskView)
        self.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            modelInfoStaskView.topAnchor.constraint(equalTo: topAnchor),
            modelInfoStaskView.bottomAnchor.constraint(equalTo: bottomAnchor),
            modelInfoStaskView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            modelInfoStaskView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            leftButtonLabel.leftAnchor.constraint(equalTo: leftButton.leftAnchor),
            leftButtonLabel.rightAnchor.constraint(equalTo: leftButton.rightAnchor),
            leftButtonLabel.topAnchor.constraint(equalTo: leftButton.topAnchor),
            leftButtonLabel.bottomAnchor.constraint(equalTo: leftButton.bottomAnchor),
            
            rightButtonLabel.leftAnchor.constraint(equalTo: rightButton.leftAnchor),
            rightButtonLabel.rightAnchor.constraint(equalTo: rightButton.rightAnchor),
            rightButtonLabel.topAnchor.constraint(equalTo: rightButton.topAnchor),
            rightButtonLabel.bottomAnchor.constraint(equalTo: rightButton.bottomAnchor),
        ])
    }

    @objc private func tapOnRightButton(sender: UIButton) {
        delegate?.rightButtonHandler()
    }

    @objc private func tapOnLeftButton(sender: UIButton) {
        delegate?.leftButtonHandler()
    }
}
