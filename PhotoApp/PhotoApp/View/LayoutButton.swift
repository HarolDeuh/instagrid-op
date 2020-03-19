//
//  LayoutButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 27/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class LayoutButton: UIButton {
    
    var isOn: Bool = false
    let selectedSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    var buttonDesc: String {
        get {
            return "Je suis le bouton numéro \(tag)"
        }
    }
    
    
    func layoutSelected() {
        if !isOn {
            self.isSelected = true
            buttonStyle()
            
        } else {
            self.isSelected = false
        }
        isOn.toggle()
    }

    
    private func buttonStyle() {
        addSubview(selectedSubview)
        
    }
    
    
    
    

}
