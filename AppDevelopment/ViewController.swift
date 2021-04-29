//
//  ViewController.swift
//  DreamDream
//
//  Created by 원석 on 2021/04/08.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func swipeToRight(_ sender: Any) {
        let direction: UISwipeGestureRecognizer.Direction
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailInfo = segue.destination as? DetailViewController{
            detailInfo.stringTest = "안녕하세용 기모찌!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

