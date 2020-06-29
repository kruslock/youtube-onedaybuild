//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-17.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the titel
        self.titleLable.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache befor downloding data
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Downlode the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL sesion object
        
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that that this cell is currently sett to desplay
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has ben recycled for anather video and no longer matches the thumbnail that was downloded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
                
            }
        }
        // Start data task
        dataTask.resume()
    }

}
