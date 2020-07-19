//
//  VideoTableViewCell.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 18/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        guard self.video != nil else { return }
        
        // Set the title label
        self.titleLabel.text = video?.title
        
        // Set the date label
        self.dateLabel.text = DateManager.getDateFormat(video!.publishedDate)
        
        // Set the thumbnail
        guard video?.thumbnailUrlString != nil else { return }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnailUrlString!) {
            
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return // else break
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnailUrlString!)
        
        // Get the shared URL Session Object
        let session = URLSession.shared
        
        // Creata a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnailUrlString {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was download
                    return
                }
                
                // Create the Image object
                let image = UIImage(data: data!)
                
                // Set the Image View
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
            
        }
        // Start data task
        dataTask.resume()
        
    }
}
