//
//  LayoutButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 27/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class LayoutButton: UIButton {
    
    enum ButtonState {
        case selected, notStelected, defaut

    }
    
    
    var isOn: Bool = false
    let thePrint: String = "Pressé !"
    let selectedSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    var buttonState: ButtonState = .defaut
    
    
    
    func layoutSelected() {
        if !isOn {
            self.isSelected = true
        } else {
            self.isSelected = false
        }
        isOn.toggle()
    }

    
    private func buttonStyle() {
        addSubview(selectedSubview)
        
    }
    
    func setbuttonStyle() {
        switch buttonState {
        case .selected:
            print("selectionné")
        case .notStelected:
            print("pas selectionné")
        case .defaut:
            print("rien")
        }
    }
    

}
