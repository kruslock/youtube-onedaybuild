//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-02.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
//

import Foundation


struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLlb3q7unEBfPUtsLe6JSz5DkWyevLio7R"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}


