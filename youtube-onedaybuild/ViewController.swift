//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Christoffer Carlsson on 2020-06-01.
//  Copyright © 2020 Christoffer Carlsson. All rights reserved.
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

