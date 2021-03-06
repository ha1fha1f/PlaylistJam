//
//  SelectedSongCell.swift
//  TachDesiginKyotoInaka
//
//  Created by 山口 智生 on 2015/09/14.
//  Copyright (c) 2015年 NextVanguard. All rights reserved.
//

import UIKit

class SelectedSongCell: UICollectionViewCell {
    @IBOutlet var iconView: UIImageView!
    
    func setSong(song: Song) {
        if let url = NSURL(string: song.artworkUrl) {
            self.iconView.sd_setImageWithURL(url)
        } else {
            //TODO set default image
        }
    }
}