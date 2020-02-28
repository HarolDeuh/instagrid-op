//
//  CustomStackView.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 28/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
    
    enum Style {
        case layout1, layout2, layout3, random
    }
    
    var style: Style = .random {
        didSet {
            setStyle(style)
        }
    }
    
    func addBackgroundColor(color: UIColor) {
        let mySubview = UIView(frame: bounds)
        mySubview.backgroundColor = color
        mySubview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(mySubview, at: 0)
    }
    
    private func setStyle(_ style: Style) {
        
        switch style {
        case .layout1:
            layoutStyle()
            layoutDefault()
            print("Je suis bien le layout 1")
        case .layout2:
            layoutStyle()
        case .layout3:
            layoutStyle()
        case .random:
            layoutDefault()
        }
    }
    
    private func layoutStyle() {
        arrangedSubviews[1].isHidden = true
    }
    
    func layoutDefault() {
        
        //arrangedSubviews[1].isHidden = false
        
        for _ in arrangedSubviews.enumerated() {
            isHidden = false
        }
    }

    

}
