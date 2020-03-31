//
//  Custom.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 11/03/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class Custom: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    weak var controller: UIViewController?
    var pickerController = UIImagePickerController()
    
    
    let presentation = "je suis la customview"
    
    @IBAction func handleImageButtonPressed(_ sender: ImagePickerButton) {
        print(sender.presentation)
        
    }
}

extension Custom: UIImagePickerControllerDelegate {
    // le code
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFill
            imageView.image = pickedImage
        }
        controller?.dismiss(animated: true, completion: nil)
    }
}

extension Custom: UINavigationControllerDelegate {
    // Rien ici
}
