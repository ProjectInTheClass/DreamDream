//
//  ViewController.swift
//  DreamDream
//
//  Created by 원석 on 2021/04/08.
//

import UIKit

class InitialViewController: UIViewController {

    @IBAction func SegueSwipeUp(sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "toSettings", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

