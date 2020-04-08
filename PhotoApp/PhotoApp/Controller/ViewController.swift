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
    
    // ImagePicker Outlet
    @IBOutlet weak var imagePickerTopLeft: ImagePickerView!
    @IBOutlet weak var imagePickerTopRight: ImagePickerView!
    @IBOutlet weak var imagePickerBottomLeft: ImagePickerView!
    @IBOutlet weak var imagePickerBottomRight: ImagePickerView!
    
    // Variables
    var selectedLayoutButton: LayoutButton?
    var currentImagePickerView: ImagePickerView?
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            selectedLayoutButton = sender
            sender.updateLayout(topStackView, bottomStackView)
        }
    }

    
    func presentImagePicker() {
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

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            currentImagePickerView?.imageView.contentMode = .scaleAspectFill
            currentImagePickerView?.imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {}


// MARK: - ImagePickerDelegate

extension ViewController: ImagePickerDelegate {
    func imagePickerButtonWasPressed(_ imagePicker: ImagePickerView) {
        currentImagePickerView = imagePicker
        presentImagePicker()
        
    }
}
