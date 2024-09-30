//
//  HomeSeperateLineCollectionViewCell.swift
//  CoupangApp
//
//  Created by yujaehong on 9/30/24.
//

import UIKit

struct HomeSeperateLineCollectionViewCellViewModel: Hashable {
    
}

final class HomeSeperateLineCollectionViewCell: UICollectionViewCell {
    
    static let reusableId: String = "HomeSeperateLineCollectionViewCell"
    
    func setViewModel(_ viewModel: HomeSeperateLineCollectionViewCellViewModel){
        contentView.backgroundColor = CPColor.gray1
    }
}

extension HomeSeperateLineCollectionViewCell {
    static func seperateLineLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(11))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
        return section
    }
}
