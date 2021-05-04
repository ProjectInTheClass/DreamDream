//
//  ViewController.swift
//  Toy_swipe
//
//  Created by Jeon jaeil on 2021/05/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func swipeUp(sender: UISwipeGestureRecognizer){
        self.performSegue(withIdentifier: "segueSwipeUp", sender: self)
    }
    
}

