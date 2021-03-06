//
//  CheckButton.swift
//  TachDesiginKyotoInaka
//
//  Created by 坂本時緒 on 9/13/15.
//  Copyright (c) 2015 NextVanguard. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    //images
    let checkedImage = UIImage(named: "checkedSongButton")
    let unCheckedImage = UIImage(named: "songPlusButton")
    
    //bool propety
    var isChecked:Bool = false {
        didSet{
            self.setBackgroundImage(isChecked ? checkedImage : unCheckedImage, forState: .Normal)
        }
    }
}
