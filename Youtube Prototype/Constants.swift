//
//  Constants.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 15/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyBOZY0EgskspClpObKMFhzgD2l9REfJrhE"
    static var PLAYLIST_ID = "PLHFlHpPjgk72Fkgmmnc41eEQIdbRcVGjq"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
}
