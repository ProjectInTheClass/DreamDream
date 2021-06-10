//
//  ContentLibraryViewController.swift
//  DreamDream
//
//  Created by Jeon jaeil on 2021/06/10.
//

import UIKit

class ContentLibraryViewController: UIViewController {
    
    @IBOutlet weak var videoTable: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
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

        overrideUserInterfaceStyle = .dark
        
        videos = [video1, video2, video3, video4, video5]
        
        videoTable.backgroundColor = UIColor.clear
        
    }
    
    
    // MARK: - Navigation
    
    @IBAction func unwindToContentLibraryView(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        guard unwindSegue.identifier == "saveUnwind", let sourceViewController = unwindSegue.source as? AddEditVideoTableViewController, let video = sourceViewController.video else { return }
        
        if let selectedIndexPath = videoTable.indexPathForSelectedRow {
            videos[selectedIndexPath.row] = video
            videoTable.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: videos.count, section: 0)
            videos.append(video)
            videoTable.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addVideo" { return }
        if segue.identifier == "videoSegue" {
            let destinationViewController = segue.destination as! videoWebViewController
            destinationViewController.video = sender as? Video
        }
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            videos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = videos.remove(at: sourceIndexPath.row)
        videos.insert(movedItem, at: destinationIndexPath.row)
        videoTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("##### Select \(indexPath.row)th cell! #####")
        let selectedItem = videos[indexPath.row]
        performSegue(withIdentifier: "videoSegue", sender: selectedItem)
    }
    
    @IBAction func editTable(_ sender: Any) {
        if self.videoTable.isEditing {
            self.editButton.title = "Edit"
            self.videoTable.setEditing(false, animated: true)
        } else {
            self.editButton.title = "Done"
            self.videoTable.setEditing(true, animated: true)
        }
    }
    
}

