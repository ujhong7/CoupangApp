//
//  HomeViewController.swift
//  CoupangApp
//
//  Created by yujaehong on 9/20/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Section: Int {
        case banner
        case horizontalProductItem
        case verticalProductItem
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    
    private var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
        applySnapShot()
        
        collectionView.collectionViewLayout = compositionalLayout
    }
    
    private static func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch Section(rawValue: section) {
            case .banner:
                return HomeBannerCollectionViewCell.bannerLayout()
            case .horizontalProductItem:
                return HomeProductCollectionViewCell.horizontalProductItemLayout()
            case .verticalProductItem:
                return HomeProductCollectionViewCell.verticalProductItemLayout()
            case .none: return nil
            }
        }
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
            switch Section(rawValue: indexPath.section) {
            case .banner:
                return self?.bannerCell(collectionView, indexPath, viewModel)
            case .horizontalProductItem, .verticalProductItem:
                return self?.productItemCell(collectionView, indexPath, viewModel)
            case .none:
                return .init()
            }
        })
    }
    
    private func applySnapShot() {
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        
        snapShot.appendSections([.banner])
        snapShot.appendItems([
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide1)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide2)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide3))],
                             toSection: .banner)
        dataSource?.apply(snapShot)
        
        snapShot.appendSections([.horizontalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation1", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation2", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation3", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation4", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation5", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000")],
                             toSection: .horizontalProductItem)
        dataSource?.apply(snapShot)
        
        snapShot.appendSections([.verticalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation7", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation8", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation9", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation10", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation11", reasonDiscountString: "쿠폰할인", originalPrice: "10000", discountPrice: "8000")],
                             toSection: .verticalProductItem)
        dataSource?.apply(snapShot)
    }
    
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell
        else { return .init() }
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func productItemCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
              let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell
        else { return .init()}
        cell.setViewModel(viewModel)
        return cell
    }
    
}

#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
