//
//  ViewController.swift
//  toy
//
//  Created by Jeon jaeil on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateColor()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
    }
    
    func updateColor() {
        var red :CGFloat = 0
        var green :CGFloat = 0
        var blue :CGFloat = 0
        
        if redSwitch.isOn {
            red = 1
        }
        if greenSwitch.isOn {
            green = 1
        }
        if blueSwitch.isOn {
            blue = 1
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        colorView.backgroundColor = color
    }

}

