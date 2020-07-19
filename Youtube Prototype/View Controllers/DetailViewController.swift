//
//  DetailViewController.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 19/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there's a video
        guard video != nil else { return }
        
        // Create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId!
        
        // Load it into the webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        dateLabel.text = DateManager.getDateFormat(video!.publishedDate)
        
        // Set the description
        textView.text = video!.description
    }
}

