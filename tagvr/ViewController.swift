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
    @IBOutlet weak var videoVRView: GVRVideoView!
    @IBOutlet weak var photoVRView: GVRPanoramaView!
    @IBOutlet weak var menuPanoView: GVRPanoramaView!
    
    
    var vrVideo: VRVideo?
    var vrPhoto: VRPhoto?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.menuPanoView.load(UIImage(named: "tokyo360")!, of: GVRPanoramaImageType.mono)
        }
        
        
        if let vrVideo = vrVideo {
            videoVRView.load(from: URL(string: vrVideo.video))
            videoVRView.enableCardboardButton = true
            videoVRView.enableFullscreenButton = true
            detailImageView.image = vrVideo.photo
            detailTitle.text = vrVideo.title
            detailDuration.text = vrVideo.duration
        }
        
        if let vrPhoto = vrPhoto {
            photoVRView.load(vrPhoto.photo, of: GVRPanoramaImageType.mono)
            photoVRView.enableCardboardButton = true
            photoVRView.enableFullscreenButton = true

        }
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

