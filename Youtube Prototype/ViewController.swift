//
//  ViewController.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 14/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getVideos()
    }
    
    // MARK: - Model Delegate Methods
    
    func videosReturn(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the table view
        self.tableView.reloadData()
    }
    
}

//MARK: - Table View Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the cell with the data
        // Get & then Set the title for the videos
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

