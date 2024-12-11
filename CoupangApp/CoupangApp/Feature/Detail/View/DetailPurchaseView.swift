//
//  DetailPurchaseView.swift
//  CoupangApp
//
//  Created by yujaehong on 12/11/24.
//

import SwiftUI

final class DetailPurchaseViewModel: ObservableObject {
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
    
    @Published var isFavorite: Bool
}

struct DetailPurchaseView: View {
    
    @ObservedObject var viewModel: DetailPurchaseViewModel
    var onFavoriteTapped: () -> Void
    var onPurchaseTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 30, content: {
            Button(action: onFavoriteTapped, label: {
                viewModel.isFavorite ? Image(.favoriteOn) : Image(.favoriteOff)
            })
            Button(action: onPurchaseTapped, label: {
                Text("구매하기")
                    .font(CPFont.SwiftUI.medium16)
                    .foregroundStyle(CPColor.SwiftUI.wh)
            })
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(CPColor.SwiftUI.keyColorBlue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        })
        .padding(.top, 10)
        .padding(.horizontal, 25)
    }
}

#Preview {
    DetailPurchaseView(viewModel: DetailPurchaseViewModel(isFavorite: false),
                       onFavoriteTapped: {},
                       onPurchaseTapped: {})
}
