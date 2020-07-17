//
//  Model.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 15/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation


protocol ModelDelegate {
    
    func videosReturn(_ videos: [Video])
}


class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            print("ERROR: url is nil")
            return
            
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                
                print("ERROR: error != nil or data = nil")
            }
            
            do {
                // Parsing the data into  video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // set the conversion type for date from JSON Object
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    //  Call the "videosReturn" method
                    DispatchQueue.main.async {
                        self.delegate?.videosReturn(response.items!)
                    }
                }
                
            } catch {
                print("ERROR: Parsing the data into  video objects")
            }
            
        }
        
        // Start the task
        dataTask.resume()
    }
}
