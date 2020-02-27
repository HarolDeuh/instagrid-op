//
//  ViewController.swift
//  PhotoApp
//
//  Created by harold aholoukpe on 26/02/2020.
//  Copyright © 2020 harold aholoukpe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    @IBOutlet weak var firstLayout: UIButton!
    @IBOutlet weak var secondLayout: UIButton!
    @IBOutlet weak var thirdLayout: UIButton!
    
    func layoutIsSelected(_ theButton: UIButton) {
        theButton.addSubview(UIImageView(image: #imageLiteral(resourceName: "Selected")))
    }
    
    func testSelected() {
        let isSelectedSubview = UIImageView(image: #imageLiteral(resourceName: "Selected"))
        
        
    }
    
    @IBAction func firstLayoutTapped(_ sender: Any) {
        firstLayout.addSubview(UIImageView(image: #imageLiteral(resourceName: "Selected")))
        
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

