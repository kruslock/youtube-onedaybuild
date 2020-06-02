//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-02.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyD4iL8r4kbwHRXDoAPoVr0PJ_e8pRH6xKY"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
