//
//  HomeProductCollectionViewCell.swift
//  CoupangApp
//
//  Created by yujaehong on 9/20/24.
//

import UIKit

struct HomeProductCollectionViewCellViewModel: Hashable {
    let imageUrlString: String
    let title: String
    let reasonDiscountString: String
    let originalPrice: String
    let discountPrice: String
}

class HomeProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productItemImageView: UIImageView! {
        didSet {
            productItemImageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productReasonDiscountLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    func setViewModel(_ viewModel: HomeProductCollectionViewCellViewModel) {
        //        productItemImageView.image =
        productTitleLabel.text = viewModel.title
        productReasonDiscountLabel.text = viewModel.reasonDiscountString
        originalPriceLabel.attributedText = NSMutableAttributedString(string: viewModel.originalPrice,
                                                                      attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        discountPriceLabel.text = viewModel.discountPrice
    }
}

extension HomeProductCollectionViewCell {
    static func horizontalProductItemLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(117), heightDimension: .estimated(224))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 22, leading: 33, bottom: 0, trailing: 33)
        return section
    }
    
    static func verticalProductItemLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2), heightDimension: .estimated(277))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(277))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 20, leading: 10, bottom: 0, trailing: 19)
        return section
    }
}
