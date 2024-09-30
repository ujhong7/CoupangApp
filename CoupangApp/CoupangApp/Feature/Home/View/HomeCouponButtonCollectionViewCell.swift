//
//  HomeCouponButtonCollectionViewCell.swift
//  CoupangApp
//
//  Created by yujaehong on 9/30/24.
//

import UIKit
import Combine

struct HomeCouponButtonCollectionViewCellViewModel: Hashable {
    enum CouponState {
        case enable
        case disable
    }
    var state: CouponState
}

final class HomeCouponButtonCollectionViewCell: UICollectionViewCell {
    
    static let reusableId: String = "HomeCouponButtonCollectionViewCell"
    
    private weak var didTapCouponDownload: PassthroughSubject<Void, Never>?
    
    @IBOutlet private weak var couponButton: UIButton! {
        didSet {
            couponButton.setImage(CPImages.buttonActivate, for: .normal)
            couponButton.setImage(CPImages.buttonComplete, for: .disabled)
        }
    }
    
    func setViewModel(_ viewModel: HomeCouponButtonCollectionViewCellViewModel, _ didTapCouponDownload: PassthroughSubject<Void, Never>?) {
        self.didTapCouponDownload = didTapCouponDownload
        switch viewModel.state {
        case .enable:
            couponButton.isEnabled = true
        case .disable:
            couponButton.isEnabled = false
        }
    }
    
    @IBAction private func didTapCouponButton(_ sender: Any) {
        didTapCouponDownload?.send()
    }
    
}

extension HomeCouponButtonCollectionViewCell {
    static func couponButtonItemLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(37))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 28, leading: 22, bottom: 0, trailing: 22)
        return section
    }
}
