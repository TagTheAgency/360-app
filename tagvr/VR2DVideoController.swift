//
//  VR2DVideoController.swift
//  tagvr
//
//  Created by Tag User #1 on 12/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VR2DVideoController: UIViewController {
    
   
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDuration: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var vrVideo: VRVideo?
    
    
    var av      :AVPlayerViewController!
    var player  :AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let vrVideo = vrVideo {
            let fileURL: NSURL? = NSURL(string: vrVideo.video)
            player = AVPlayer(url: fileURL! as URL)
            av = AVPlayerViewController()
            av.player = player
            
            detailImageView.image = vrVideo.photo
            detailTitle.text = vrVideo.title
            detailDuration.text = vrVideo.duration
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playVideo(_ sender: AnyObject) {
        self.present(av, animated: true) {
            self.av.player!.play()
        }
    }
    

}
