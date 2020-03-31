//
//  ImageButton.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 11/03/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage, description: String)
}

class ImagePickerButton: UIButton {
    
    let presentation = "je suis un picker bouton"
    let imagePicker = UIImagePickerController()
    var controller = UIViewController()
    

}
