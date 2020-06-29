//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-22.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use the url as a key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
    
}
