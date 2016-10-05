//
//  ViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 22/08/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDuration: UILabel!
    
    var vrVideo: VRVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vrVideo = vrVideo {
            detailImageView.image = vrVideo.photo
            detailTitle.text = vrVideo.title
            detailDuration.text = vrVideo.duration
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

