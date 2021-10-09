//
//  TraidCard.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit

class TraidCard: UIView {
    
    private let backgroundView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.clipsToBounds = true
        background.layer.cornerRadius = 10
        background.backgroundColor = .white
        return background
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    private let descriptionTextFiled: UITextView = {
        let sampleTextField =  UITextView()
        sampleTextField.text = """
            Акция — это доля в компании. Инвестор, купивший акции, становится совладельцем бизнеса, он может претендовать на часть его прибыли и имущества. Чем большую прибыль получит эмитент, тем больше заработает акционер. С другой стороны, если компания обанкротится, то и стоимость акций упадёт до нуля — тогда инвестор потеряет деньги.
"""
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.showsVerticalScrollIndicator = false
        sampleTextField.isScrollEnabled = true
        sampleTextField.sizeToFit()
        return sampleTextField
    }()
    
    init(withImage image: UIImage?, title: String) {
        super.init(frame: .zero)
        imageView.image = image
//        descriptionTextFiled.text = title
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    private func initialize() {
        addSubview(backgroundView)
        backgroundView.anchorToSuperview()
        backgroundView.addSubview(imageView)
        backgroundView.addSubview(descriptionTextFiled)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            descriptionTextFiled.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionTextFiled.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            descriptionTextFiled.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            descriptionTextFiled.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20)
        ])
        applyShadow(radius: 8, opacity: 0.2, offset: CGSize(width: 0, height: 2))
    }
}
