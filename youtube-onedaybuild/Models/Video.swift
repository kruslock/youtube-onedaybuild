//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-02.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
//

import Foundation


struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
   
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Pars the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Pars thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
    
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Pars video ID
        let resourceIdcontainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdcontainer.decode(String.self, forKey: .videoId)
        
    }
    
}
