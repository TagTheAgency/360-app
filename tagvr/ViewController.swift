//
//  ViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 22/08/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuPanoView: GVRPanoramaView!
        
    var vrVideo: VRVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.menuPanoView.load(UIImage(named: "landing-page-360")!, of: GVRPanoramaImageType.mono)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.menuPanoView.load(UIImage(named: "landing-page-360")!, of: GVRPanoramaImageType.mono)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.menuPanoView.load(nil)

    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

