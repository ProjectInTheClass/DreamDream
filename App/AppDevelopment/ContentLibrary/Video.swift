//
//  Video.swift
//  DreamDream
//
//  Created by Jeon jaeil on 2021/06/09.
//

import Foundation

class Video: Codable {
    var defaultKey = "p2fxv3PAtLU"
    var key: String
    var thumnailURL: URL
    var videoURL: URL
    var title: String
    
    init(key: String, title: String) {
        self.key = key
        self.title = title
        if let thumnailurl = URL(string: "https://img.youtube.com/vi/\(key)/0.jpg") {
            self.thumnailURL = thumnailurl
        } else {
            self.thumnailURL = URL(string: "https://img.youtube.com/vi/\(defaultKey)/0.jpg")!
            print("thumnail URL fail")
        }
        if let videourl = URL(string: "https://www.youtube.com/embed/\(key)") {
            self.videoURL = videourl
        } else {
            self.videoURL = URL(string: "https://www.youtube.com/embed/\(defaultKey)")!
            print("video URL fail")
        }
    }
    /*
    func setTitle(title: String) {
        self.title = title
    }
    */
}
