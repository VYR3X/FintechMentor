//
//  TinderButton.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import PopBounceButton

/// Круглая кнопка в таббаре
final class TinderButton: PopBounceButton {
    
    override init() {
        super.init()
        adjustsImageWhenHighlighted = false
        backgroundColor = .white
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = frame.width / 2
    }
}
