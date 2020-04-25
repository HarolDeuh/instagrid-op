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
    
    // Main View
    @IBOutlet weak var mainView: UIView!
    
    // ImageView
    @IBOutlet weak var arrowImageView: UIImageView!
    
    
    // Variables
    var selectedLayoutButton: LayoutButton?
    var currentImagePickerView: ImagePickerView?
    var imagePickerViews = [ImagePickerView]()
    var currentGesture: UIGestureRecognizer?
    
    var isPortrait: Bool = {
//        return UIApplication.shared.statusBarOrientation.isLandscape
        return UIInterfaceOrientation.portrait.isPortrait
        
    }()
    
    
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            selectedLayoutButton = sender
            sender.updateLayout(topStackView, bottomStackView)
            noImages()
        }
        
    }
    
    func noImages() {
        imagePickerViews.forEach { imagepickerview in
            imagepickerview.resetImage()
        }
        
        
    }

    
    func presentImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    private func transformMainViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: mainView)
        mainView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    private func shareImage(_ image: UIImage, mainViewPosition: CGPoint) {
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(activityController, animated: true) {
            self.mainView.center = mainViewPosition
        }
    }
    
    private func createImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: mainView.bounds.size)
        let image = renderer.image { ctx in
            mainView.drawHierarchy(in: mainView.bounds, afterScreenUpdates: true)
        }
        
        return image
    }

   
    
    @objc func handleSwipe(_ swipe: UISwipeGestureRecognizer) {
        let mainViewOrigin = self.mainView.center
        var mainViewPosition = mainViewOrigin
        
        UIView.animate(withDuration: 0.7, animations: {
            
            if !UIWindow.isLandscape {
                mainViewPosition.y = -1000
            } else {
                mainViewPosition.x = -1000
            }
            self.mainView.center = mainViewPosition
            
        }) { _ in
            let imageToShare = self.createImage()
            
            self.shareImage(imageToShare, mainViewPosition: mainViewOrigin)
            
        }
    }
    

    fileprivate func configureSwipeGesture() {
        
        if let currentGesture = currentGesture {
            mainView.removeGestureRecognizer(currentGesture)
        }
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGesture.direction = !UIWindow.isLandscape ? .up : .left
        
        currentGesture = swipeGesture
        mainView.addGestureRecognizer(swipeGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedLayoutButton = thirdLayoutButton
        thirdLayoutButton.toggleSelected()
        firstLayoutButton.layout = .first
        secondLayoutButton.layout = .second
        thirdLayoutButton.layout = .third
        
        imagePickerViews = [imagePickerTopLeft, imagePickerTopRight, imagePickerBottomLeft, imagePickerBottomRight]


    }
    // coordinator.animate legit ?
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            self.instructionLabel.text = !UIWindow.isLandscape ? "Swipe up to share" : "Swipe left to share"
            self.configureSwipeGesture()
            
            
            self.arrowImageView.image = !UIWindow.isLandscape ? UIImage(named: "arrowUp") : UIImage(named: "arrowLeft")
            
            
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureSwipeGesture()
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            currentImagePickerView?.imageView.contentMode = .scaleAspectFill
            currentImagePickerView?.imageView.image = pickedImage
            currentImagePickerView?.imagePickerButton.imageView?.isHidden = true
            
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

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}


