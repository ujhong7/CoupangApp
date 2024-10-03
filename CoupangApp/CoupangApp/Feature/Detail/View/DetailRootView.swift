//
//  DetailRootView.swift
//  CoupangApp
//
//  Created by yujaehong on 10/3/24.
//

import SwiftUI

struct DetailRootView: View {
    
    var viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                VStack(spacing: 0, content: {
                    if let banners = viewModel.state.banners {
                        DetailBannerView(viewModel: banners)
                    }
                })
            }
        }
        
        if viewModel.state.isLoading {
            Text("로딩중")
        } else {
            Text("로딩중")
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                viewModel.process(.loadData)
            })
    }
}

#Preview {
    DetailRootView(viewModel: DetailViewModel())
}
