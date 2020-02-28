//
//  ViewController.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 26/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    // My constants
    let isSelectedView = UIImageView(image: #imageLiteral(resourceName: "Selected"))
    let selectedlayout1 = #imageLiteral(resourceName: "selectedLayout1")
    let selectedLayout2 = #imageLiteral(resourceName: "selectedLayout2")
    let selectedLayout3 = #imageLiteral(resourceName: "selectedLayout3")
   
        
    @IBAction func firstLayoutTapped(_ sender: UIButton) {
        manageTopStackView()
    }
    
    @IBAction func secondLayoutTapped(_ sender: UIButton) {
        manageBottomStackView()
    }
    
    @IBAction func thirdLayoutPressed(_ sender: UIButton) {
        manageDefaultView()
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
        
        firstLayout.setImage(selectedlayout1, for: .selected)
        secondLayout.setImage(selectedLayout2, for: .selected)
        thirdLayout.setImage(selectedLayout3, for: .selected)
        
        firstLayout.setImage(#imageLiteral(resourceName: "layout1"), for: .disabled)
        secondLayout.setImage(#imageLiteral(resourceName: "layout2"), for: .disabled)
        thirdLayout.setImage(#imageLiteral(resourceName: "layout3"), for: .disabled)
        //topStackView.addBackgroundColor(color: #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1))
        
        
    }


}




