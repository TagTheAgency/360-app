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
    @IBOutlet weak var videoView: GVRVideoView!
    
    var vrVideo: VRVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.videoView = GVRVideoView()
//        self.videoView.delegate = self
//        self.videoView.enableFullscreenButton = true
//        self.videoView.enableCardboardButton = true
//        scrollView.addSubview(videoView)
        
        if let vrVideo = vrVideo {
            videoView.load(from: URL(string: "favela.mp4"))
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

