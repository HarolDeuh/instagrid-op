//
//  Custom.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 11/03/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage, description: String)
}

class Custom: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func handleImageButtonPressed(_ sender: UIButton) {
        
        
    }
    
    weak var imageCustomDelegate: ImagePickerDelegate?
    
    func addImageBackground() {
        let mySubview = UIView()
        mySubview.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addSubview(mySubview)
    }
    
    
}
