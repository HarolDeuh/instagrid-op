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
    let thePrint: String = "Pressé !"
    let selectedSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    
    
    func layoutSelected() {
        if !isOn {
            addSubview(selectedSubview)
            print(isOn)
        } else {
            selectedSubview.removeFromSuperview()
            print(isOn)
        }
        isOn.toggle()
    }
    
    

}
