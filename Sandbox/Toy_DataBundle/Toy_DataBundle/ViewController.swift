//
//  ViewController.swift
//  Toy_DataBundle
//
//  Created by Jeon jaeil on 2021/04/29.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var userData: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "movies", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        
        let decoded: Dictionary<String, String> = try! PropertyListDecoder().decode(Dictionary<String, String>.self, from: data)
        
        label.text = decoded["Avengers"]!
    }
    
}

