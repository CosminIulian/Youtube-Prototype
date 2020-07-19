//
//  Video.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 15/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var videoId: String?
    var title: String?
    var description: String?
    var thumbnailUrlString: String?
    var publishedDate = Date()
    
    enum CodingKeys: String, CodingKey {
        // For accesing what we need
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case thumbnail = "url"
        case title        // we don't need
        case description //       to specified the value
        case videoId    //            because has the same name
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.publishedDate = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnail
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnailUrlString = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video Id
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
    
}
