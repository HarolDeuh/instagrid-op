//
//  LayoutButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 27/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

enum LayoutState {
    case first, second, third
}

class LayoutButton: UIButton {
    
    var layout: LayoutState = .third
    
    enum Style {
        case standard, selected
    }
    
    var style: Style = .standard {
        didSet{
            setStyle(style)
        }
    }
    
    var imgSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    
    func setStyle(_ style: Style) {
        switch style {
        case .standard:
            imgSubview.removeFromSuperview()
        case .selected:
            addSubview(imgSubview)
        }
    }
    
    func toggleSelected() {
        style = self.style == .selected ? .standard : .selected
    }
    
    func updateLayout(_ upStackView: CustomStackView, _ downStackView: CustomStackView) {
        switch layout {
        case .first:
            upStackView.arrangedSubviews[1].isHidden = true
            downStackView.arrangedSubviews[1].isHidden = false
        case .second:
            upStackView.arrangedSubviews[1].isHidden = false
            downStackView.arrangedSubviews[1].isHidden = true
        case .third:
            upStackView.arrangedSubviews[1].isHidden = false
            downStackView.arrangedSubviews[1].isHidden = false
        }
    }
    
}
