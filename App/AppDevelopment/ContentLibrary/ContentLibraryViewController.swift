//
//  ContentLibraryViewController.swift
//  DreamDream
//
//  Created by Jeon jaeil on 2021/06/10.
//

import UIKit

class ContentLibraryViewController: UIViewController {
    
    @IBOutlet weak var videoTable: UITableView!
    
    let video1 = Video(key: "p2fxv3PAtLU", title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)")
    //video1.setTitle(title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)")
    let video2 = Video(key: "lHn7xv4Zxjg", title: "10시간 당신을 위로하는 수면음악 🎵 스트레스해소음악, 불면증치료음악, 잠잘오는음악, 수면유도음악 (Remember)")
    //video2.setTitle(title: "10시간 당신을 위로하는 수면음악 🎵 스트레스해소음악, 불면증치료음악, 잠잘오는음악, 수면유도음악 (Remember)")
    let video3 = Video(key: "gnQcIfUp8Ao", title: "하루의 끝, 편안한 침실에서 듣는 수면음악☁잠잘때 듣는 음악,불면증 치료 음악,수면유도음악")
    //video3.setTitle(title: "하루의 끝, 편안한 침실에서 듣는 수면음악☁잠잘때 듣는 음악,불면증 치료 음악,수면유도음악")
    let video4 = Video(key: "QWjVYAJ8bIQ", title: "♥6시간 델타파,미국 수면의학회 추천 수면음악,백색소음,asmr,빗소리,잠오는영상,잠오는 소리,잠오는 클래식,깊은 수면음악,불면증치료,잠오는 노래 ,잠잘오는음악,잠잘오는노래")
    //video4.setTitle(title: "♥6시간 델타파,미국 수면의학회 추천 수면음악,백색소음,asmr,빗소리,잠오는영상,잠오는 소리,잠오는 클래식,깊은 수면음악,불면증치료,잠오는 노래 ,잠잘오는음악,잠잘오는노래")
    let video5 = Video(key: "WIqe9vM4U34", title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)")
    //video5.setTitle(title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)")
    var videos: [Video] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        videos = [video1, video2, video3, video4, video5]
        
        videoTable.backgroundColor = UIColor.clear
        
    }
}
    
extension ContentLibraryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        
        cell.backgroundColor = UIColor.clear

        let video = videos[indexPath.row]

        cell.update(with: video)
        cell.showsReorderControl = true
        return cell
    }
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

