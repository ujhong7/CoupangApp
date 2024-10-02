//
//  PurchaseButton.swift
//  CoupangApp
//
//  Created by yujaehong on 10/2/24.
//

import UIKit

final class PurchaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = CPColor.keyColorBlue.cgColor
        setTitleColor(CPColor.keyColorBlue, for: .normal)
        setTitle("구매하기", for: .normal)
    }
}
