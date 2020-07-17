//
//  ViewController.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 14/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

