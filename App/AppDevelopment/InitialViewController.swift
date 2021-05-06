//
//  ViewController.swift
//  DreamDream
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var dreamIconButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
    }
    

}

