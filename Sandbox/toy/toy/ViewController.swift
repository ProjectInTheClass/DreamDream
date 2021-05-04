//
//  ViewController.swift
//  toy
//
//  Created by Jeon jaeil on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDreamIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "DreamIcon")
        imageDreamIcon.image = image
    }
}
