//
//  DetailViewController.swift
//  DreamDream
//
//  Created by 원석 on 2021/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var simpleContent: UILabel!
    var stringTest: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        simpleContent.text = stringTest
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
