//
//  ButtonStackView.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import PopBounceButton

protocol ButtonStackViewDelegate: AnyObject {
    func didTapButton(button: TinderButton)
}

/// Стек вью для таб бара приложения
final class ButtonStackView: UIStackView {
    
    weak var delegate: ButtonStackViewDelegate?
    
    private let undoButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "undo"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private let passButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "dislike"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    private let superLikeButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "safe"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    private let likeButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    private let boostButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "lightning"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalSpacing
        alignment = .center
        configureButtons()
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configureButtons() {
        addArrangedSubview(from: passButton, height: 50)
        addArrangedSubview(from: superLikeButton, height: 50)
        addArrangedSubview(from: likeButton, height: 50)
    }
    
    private func addArrangedSubview(from button: TinderButton, height: CGFloat) {
        let container = ButtonContainer()
        container.addSubview(button)
        button.anchorToSuperview()
        addArrangedSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: height).isActive = true
        container.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
    }
    
    @objc
    private func handleTap(_ button: TinderButton) {
        delegate?.didTapButton(button: button)
    }
}

private class ButtonContainer: UIView {
    override func draw(_ rect: CGRect) {
        applyShadow(radius: 0.2 * bounds.width, opacity: 0.05, offset: CGSize(width: 0, height: 0.15 * bounds.width))
    }
}

