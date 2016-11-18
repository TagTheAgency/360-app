//
//  VRVideoTableViewCell.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 3/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRVideoTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var coverTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        coverImageView.layer.cornerRadius = 10.0
        coverImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
