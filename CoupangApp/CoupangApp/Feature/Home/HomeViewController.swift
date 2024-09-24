//
//  HomeViewController.swift
//  CoupangApp
//
//  Created by yujaehong on 9/20/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    enum Section: Int {
        case banner
        case horizontalProductItem
        case verticalProductItem
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    private var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    private var viewModel: HomeViewModel = HomeViewModel()
    private var cancellables: Set<AnyCancellable> = [] // VC가 사라질때 사라짐
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingViewModel()
        setDataSource()
        collectionView.collectionViewLayout = compositionalLayout
        
        viewModel.process(action: .loadData)
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
    
    private func bindingViewModel() {
        viewModel.state.$collectionViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapShot()
            }.store(in: &cancellables) // VC가 있는동안 계속 관찰
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
        
        if let bannerViewModels = viewModel.state.collectionViewModels.bannerViewModels {
            snapShot.appendSections([.banner])
            snapShot.appendItems(bannerViewModels, toSection: .banner)
        }
        
        if let horizontalProductViewModels = viewModel.state.collectionViewModels.horizontalProductViewModels {
            snapShot.appendSections([.horizontalProductItem])
            snapShot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
        }
        
        if let verticalProductViewModels = viewModel.state.collectionViewModels.verticalProductViewModels {
            snapShot.appendSections([.verticalProductItem])
            snapShot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        }
        
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
