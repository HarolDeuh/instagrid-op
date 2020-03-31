//
//  ViewController.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 26/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Delegate
    let imagePicker =  UIImagePickerController()
    
    // MARK: IBOutlets
    // StackViews
    @IBOutlet weak var mainStackView: CustomStackView!
    @IBOutlet weak var topStackView: CustomStackView!
    @IBOutlet weak var bottomStackView: CustomStackView!
    @IBOutlet weak var buttonsStackView: CustomStackView!
    
    // Layouts
    @IBOutlet weak var firstLayoutButton: LayoutButton!
    @IBOutlet weak var secondLayoutButton: LayoutButton!
    @IBOutlet weak var thirdLayoutButton: LayoutButton!
    
    //Label
    @IBOutlet weak var instructionLabel: UILabel!
    
    // Button Outlet 
    @IBOutlet weak var imageButton: UIButton!
    
    // Variables
    var selectedLayoutButton: LayoutButton?
    var maView: Custom?
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            selectedLayoutButton = sender
            sender.updateLayout(topStackView, bottomStackView)
        }
    }

    
    @IBAction func imageButtonPressed(_ sender: ImagePickerButton) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedLayoutButton = thirdLayoutButton
        thirdLayoutButton.toggleSelected()
        firstLayoutButton.layout = .first
        secondLayoutButton.layout = .second
        thirdLayoutButton.layout = .third
        
        imagePicker.delegate = self

    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if UIDevice.current.orientation.isLandscape {
                // activate landscape changes
                self.instructionLabel.text = "Swipe left to share"
                
            } else {
                // activate portrait changes
                self.instructionLabel.text = "Swipe up to share"
            }
        })
    }
}


extension ViewController: UIImagePickerControllerDelegate {
    // le code
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            maView?.imageView.contentMode = .scaleAspectFill
            maView?.imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    // rien ici
}
