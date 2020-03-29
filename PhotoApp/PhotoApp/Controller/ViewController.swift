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
    var imageCustomDelegate: ImageCustomViewDelegate?
    
    // MARK: IBOutlets
    // StackViews
    @IBOutlet weak var mainStackView: CustomStackView!
    @IBOutlet weak var topStackView: CustomStackView!
    @IBOutlet weak var bottomStackView: CustomStackView!
    @IBOutlet weak var buttonsStackView: CustomStackView!
    
    // Layouts
    @IBOutlet weak var firstLayout: LayoutButton!
    @IBOutlet weak var secondLayout: LayoutButton!
    @IBOutlet weak var thirdLayout: LayoutButton!
    
    //Label
    @IBOutlet weak var instructionLabel: UILabel!
    
    // Button Outlet 
    @IBOutlet weak var imageButton: UIButton!
    
    // Variables
    var selectedLayoutButton: LayoutButton?
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        // Recuperer la valeur du layout du bouton, dans layoutubutton definir une nouvelle var qui contient un layout
        
        // Creer une methode dans le viewcontroller qui prend en parametre le layout, switch sur cette valeur puis disposition des subiew en fonction
        
        sender.upStackView = topStackView
        sender.downStackView = bottomStackView
        
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            
            selectedLayoutButton = sender
            sender.mainViewHandler(sender.tag)
    
        }
        
    }

    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        
        print("Je suis le bouton \(sender.tag)")
        
        imageCustomDelegate = self
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedLayoutButton = thirdLayout
        thirdLayout.toggleSelected()
        
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

extension ViewController: ImageCustomViewDelegate {
    func addImageToCustomView(theImg: UIImage, description: String) {
        
    }
}





