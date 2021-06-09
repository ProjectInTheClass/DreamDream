//
//  VideoTableViewCell.swift
//  DreamDream
//
//  Created by Jeon jaeil on 2021/06/09.
//

import UIKit
import Kingfisher

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with video: Video) {
        titleLabel.text = video.title
        // TODO: video title 받아오기 or 사용자가 설정
        thumnailView.kf.indicatorType = .activity
        thumnailView.kf.setImage(with: video.thumnailURL, placeholder: UIImage(named: "DreamIcon"), options: [.processor(ResizingImageProcessor(referenceSize: CGSize(width: 192.0, height: 111.0), mode: .aspectFill)), .transition(.fade(0.5)), .cacheOriginalImage])
    }
}
