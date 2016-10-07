//
//  VRVideo.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 4/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRVideo {
    
    var photo: UIImage
    var title: String
    var duration: String
    
    
    init?(photo: UIImage, title: String, duration: String) {
        
        self.photo = photo
        self.title = title
        self.duration = duration

    }
    
}
