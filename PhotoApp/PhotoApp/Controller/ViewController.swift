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
    var imageCustomDelegate: ImagePickerDelegate?
    
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
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            selectedLayoutButton = sender
            sender.updateLayout(topStackView, bottomStackView)
        }
    }

    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        imageCustomDelegate = self
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

extension ViewController: ImagePickerDelegate {
    func didSelect(image: UIImage, description: String) {
        // code
    }
}





