//
//  Custom.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 11/03/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

@objc protocol ImagePickerDelegate: AnyObject {
    func imagePickerButtonWasPressed(_ imagePicker: ImagePickerView)
}

class ImagePickerView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePickerDelegate: ImagePickerDelegate?
    
    @IBAction func handleImageButtonPressed(_ sender: ImagePickerButton) {
        
        imagePickerDelegate?.imagePickerButtonWasPressed(self)
    }
}

extension ImagePickerView: UIImagePickerControllerDelegate {}

extension ImagePickerView: UINavigationControllerDelegate {}
