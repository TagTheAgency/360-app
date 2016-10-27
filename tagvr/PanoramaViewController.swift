//
//  PanoramaViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 18/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class PanoramaViewController: UIViewController {

    @IBOutlet weak var photoVrView: GVRPanoramaView!
    
    var vrPhoto: VRPhoto?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
            self.photoVrView.load(self.vrPhoto?.photo, of: GVRPanoramaImageType.mono)
            self.photoVrView.enableCardboardButton = true
            self.photoVrView.enableFullscreenButton = true
//            if let vrPhoto = self.vrPhoto {

                
//            }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.photoVrView.load(nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
