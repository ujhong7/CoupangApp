//
//  DetailViewModel.swift
//  CoupangApp
//
//  Created by yujaehong on 10/3/24.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    struct State {
        var isLoading: Bool = false
        var banners: DetailBannerViewModel?
    }
    
    enum Action {
        case loadData
        case loading(Bool)
        case getDataSuccess(ProductDetailResponse)
        case getDataFailure(Error)
    }
    
    @Published private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            loadData()
        case let .loading(isLoading):
            state.isLoading = isLoading
        case let .getDataSuccess(response):
            print(response)
        case let .getDataFailure(error):
            print(error)
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
    
}

extension DetailViewModel {
    
    private func loadData() {
        loadDataTask = Task {
            defer {
                process(.loading(false))
            }
            do {
                process(.loading(true))
                let response = try await NetworkService.shared.getProductDetailData()
                process(.getDataSuccess(response))
            } catch {
                process(.getDataFailure(error))
            }
        }
    }
    
}
