//
//  ViewController.swift
//  Youtube Login Toy
//
//  Created by Jeon jaeil on 2021/05/14.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {

    @IBOutlet weak var textIdentifier: UITextField!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        XCDYouTubeClient.default().getVideoWithIdentifier("AgFeZr5ptV8"){ (video, error) in
            guard error == nil else{
                Utilities.shared.displayError(error! as NSError, originViewController: self)
                return
            }
            AVPlayerViewControllerManager.shared.lowQualityMode = false
            AVPlayerViewControllerManager.shared.video = video
            self.present(AVPlayerViewControllerManager.shared.controller, animated: true){
                AVPlayerViewControllerManager.shared.controller.player?.play()
            }
        }
        */
        
        // init YouTubePlayerView w/ playerFrame rect (assume playerFrame declared)
        let myVideoURL = URL(string: "https://www.apple.com")!
        
        let task = URLSession.shared.dataTask(with: myVideoURL) {(data, response, error) in
            if let data = data{
                print(data)
            }
        }
        
    }
    
    
}

