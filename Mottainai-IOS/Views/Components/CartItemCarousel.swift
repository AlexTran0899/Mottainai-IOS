//
//  CartItemCarousel.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/3/24.
//

import SwiftUI

struct CartItemCarousel: View {
    @EnvironmentObject var homeViewModel: HomeViewModel;
    var merchant: Merchant;
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(homeViewModel.getMenuItemFromCartByMerchant(merchant: merchant)) { menuItem in
                    MenuItemCarouselCard(menuItem: menuItem)
                }
            }
            .padding(.leading)
            .padding(.bottom)
        }
    }
}

#Preview {
    CartItemCarousel(merchant: MockData.merchant)
        .environmentObject(HomeViewModel())
    
}
