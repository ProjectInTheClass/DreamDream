//
//  videoWebViewController.swift
//  DreamDream
//
//  Created by Jeon jaeil on 2021/06/10.
//

import UIKit
import WebKit

class videoWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        let urlRequest = URLRequest(url: video!.videoURL)
        webView.load(urlRequest)
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
