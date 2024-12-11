//
//  OptionRootView.swift
//  CoupangApp
//
//  Created by yujaehong on 12/11/24.
//

import SwiftUI

struct OptionRootView: View {
    
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text("옵션화면")
    }
}

#Preview {
    OptionRootView(viewModel: OptionViewModel())
}
