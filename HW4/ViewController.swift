//
//  ViewController.swift
//  HW4
//
//  Created by Ann Katanska on 5/10/18.
//  Copyright © 2018 Ann Katanska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bottleType: UILabel!
    @IBOutlet weak var bottlesColor: UILabel!
    @IBOutlet weak var bottlesCapacity: UILabel!
    @IBOutlet weak var termoOrNot: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    
    let waterCup = Bottle(color: "grey", material: "Plastic", volume: 0.7, isTermo: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    
    
    func updateUI() {
        bottleType.text = waterCup.material
        bottlesColor.text = waterCup.color
        bottlesCapacity.text = "\(waterCup.volume)"
        termoOrNot.text = "\(waterCup.isTermo ? "Yes" : "No")"
    }
    
    
    @IBAction func updateContent(_ sender: Any) {
        waterCup.fill(volume: 0.1, isHot: false)
        
        self.contentLabel.text = "\(waterCup.getContent())"
    }
    
    @IBAction func pourLiquid(_ sender: Any) {
        waterCup.pour(volume: 0.15)
        
        self.contentLabel.text = "\(waterCup.getContent())"
    }
    
    @IBAction func throwOut(_ sender: Any) {
        waterCup.throwTheBottleOut()
        
        self.contentLabel.text = "\(waterCup.getContent())"
    }
    
    
    
}

