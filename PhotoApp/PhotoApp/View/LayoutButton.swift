//
//  LayoutButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 27/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class LayoutButton: UIButton {
    
    var upStackView: CustomStackView?
    var downStackView: CustomStackView?
    
    enum TheView {
        case first, second, third
    }
    
    var theView: TheView = .third {
        didSet {
            updateLayout(theView)
        }
    }
    
    
    
    enum Style {
        case standard, selected
    }
    
    var style: Style = .standard {
        didSet{
            setStyle(style)
        }
    }
    
    var imgSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    var buttonDesc : String {
        get {
            return "Je suis le bouton \(tag)"
        }
    }
    
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
    
    private func updateLayout(_ theView: TheView) {
        switch theView {
        case .first:
            upStackView?.arrangedSubviews[1].isHidden = true
            downStackView?.arrangedSubviews[1].isHidden = false
        case .second:
            upStackView?.arrangedSubviews[1].isHidden = false
            downStackView?.arrangedSubviews[1].isHidden = true
        case .third:
            upStackView?.arrangedSubviews[1].isHidden = false
            downStackView?.arrangedSubviews[1].isHidden = false
        }
    }
    
    func mainViewHandler(_ senderTag: Int) {
        switch senderTag {
        case 0:
            theView = .first
        case 1:
            theView = .second
        case 2:
            theView = .third
        default:
            print("quelque chose")
        }
        
    }
    
}
