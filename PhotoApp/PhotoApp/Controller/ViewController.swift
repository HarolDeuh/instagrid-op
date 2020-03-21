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
    
    //Constants
    let selectedlayout1 = #imageLiteral(resourceName: "selectedLayout1")
    let selectedLayout2 = #imageLiteral(resourceName: "selectedLayout2")
    let selectedLayout3 = #imageLiteral(resourceName: "selectedLayout3")
    
    // Button Outlet 
    @IBOutlet weak var imageButton: UIButton!
    
    // Variables
    var selectedLayoutButton: LayoutButton?
    
   
    @IBAction func layoutButtonPressed(_ sender: LayoutButton) {
        
        // Recuperer la valeur du layout du bouton, dans layoutubutton definir une nouvelle var qui contient un layout
        
        // Creer une methode dans le viewcontroller qui prend en parametre le layout, switch sur cette valeur puis disposition des subiew en fonction
        
        
        if sender != selectedLayoutButton {
            sender.toggleSelected()
            selectedLayoutButton?.toggleSelected()
            
            selectedLayoutButton = sender
        }
        
    }

    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        
        print("Je suis le bouton \(sender.tag)")
        
        imageCustomDelegate = self
        
    }
    
    
    
    private func manageTopStackView() {
        firstLayout.isSelected = true
        secondLayout.isSelected = false
        thirdLayout.isSelected = false
        bottomStackView.arrangedSubviews[1].isHidden = false
        topStackView.arrangedSubviews[1].isHidden = true
    }
    
    private func manageBottomStackView() {
        secondLayout.isSelected = true
        firstLayout.isSelected = false
        thirdLayout.isSelected = false
        topStackView.arrangedSubviews[1].isHidden = false
        bottomStackView.arrangedSubviews[1].isHidden = true
    }
    
    private func manageDefaultView() {
        thirdLayout.isSelected = true
        firstLayout.isSelected = false
        secondLayout.isSelected = false
        topStackView.arrangedSubviews[1].isHidden = false
        bottomStackView.arrangedSubviews[1].isHidden = false
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





