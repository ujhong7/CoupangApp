//
//  FavoriteViewModel.swift
//  CoupangApp
//
//  Created by yujaehong on 10/2/24.
//

import Foundation
import Combine

final class FavoriteViewModel {
     
    enum Action {
        case getFavoriteFromAPI
        case getFavoriteSuccess(FavoriteResponse)
        case getFavoriteFailure(Error)
        case didTapPurchaseButton
    }
    
    final class State {
        @Published var tableViewModel: [String]?
    }
    
    private(set) var state: State = State()
    
    func process(_ action: Action) {
        switch action {
        case .getFavoriteFromAPI:
            break
        case .getFavoriteSuccess(let favoriteResponse):
            break
        case .getFavoriteFailure(let error):
            break
        case .didTapPurchaseButton:
            break
        }
    }
    
}
