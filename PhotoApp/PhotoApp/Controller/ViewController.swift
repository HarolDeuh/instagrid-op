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
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    // Layouts
    @IBOutlet weak var firstLayout: LayoutButton!
    @IBOutlet weak var secondLayout: LayoutButton!
    @IBOutlet weak var thirdLayout: LayoutButton!
    
    // My constants
    let isSelectedView = UIImageView(image: #imageLiteral(resourceName: "Selected"))
   
    
    @IBAction func firstLayoutTapped(_ sender: Any) {
        firstLayout.isSelected = true
        if firstLayout.isSelected {
            print("etat du bouton")
        }
        
    }
    
    @IBAction func secondLayoutTapped(_ sender: Any) {
        secondLayout.layoutSelected()
    }
    
    @IBAction func thirdLayoutPressed(_ sender: Any) {
        thirdLayout.layoutSelected()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainStackView.addBackgroundColor(color: #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1))
    }


}


extension UIStackView {
    func addBackgroundColor(color: UIColor) {
        let mySubview = UIView(frame: bounds)
        mySubview.backgroundColor = color
        mySubview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(mySubview, at: 0)
    }
}

