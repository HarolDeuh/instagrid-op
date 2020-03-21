//
//  LayoutButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 27/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class LayoutButton: UIButton {
    
    enum Style {
        case standard, selected
    }
    
    var style: Style = .standard {
        didSet{
            setStyle(style)
        }
    }
    let selectedImage = UIImage(imageLiteralResourceName: "Selected")
    var imgSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    var buttonDesc : String {
        get {
            return "Je suis le bouton \(tag)"
        }
    }
    
    func setStyle(_ style: Style) {
        switch style {
        case .standard:
            isSelected = false
            imgSubview.removeFromSuperview()
        case .selected:
            isSelected = true
            addSubview(imgSubview)
        }
    }
    
    func toggleSelected() {
        style = self.style == .selected ? .standard : .selected
    }
    
    

}
