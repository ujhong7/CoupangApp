//
//  HomeBannerCollectionViewCell.swift
//  CoupangApp
//
//  Created by yujaehong on 9/20/24.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        ImageView.image = image
    }
}
