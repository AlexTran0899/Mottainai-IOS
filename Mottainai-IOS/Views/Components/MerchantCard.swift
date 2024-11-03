//
//  MerchantCard.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import SwiftUI

struct MerchantCard: View {
    var merchant: Merchant;
    var menuItems: [MenuItem];
    var onDismiss: (() -> Void)
    @State private var showingCart = false
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Color.appBackgroundColor.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0){
                        URLImageView(imageURL: URL(string: merchant.shopBannerURL)!)
                            .frame(width: geo.size.width)
                            .frame(maxHeight: 300)
                            .clipped()
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .shadow(radius: 20)
                            HStack{
                                Text(merchant.shopName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                        }
//                        
                        MenuItemCarousel(menuItems: menuItems)
                            .padding(.top)
                        RestaurantLocationCard(merchant: merchant)
                            .padding()
                        DescriptionCard(description: merchant.description)
                            .padding()
                        Spacer()
                    }
                }.ignoresSafeArea()
                
                VStack{
                    HStack{
                        Button {
                            onDismiss()
                        } label: {
                            Image(systemName: "arrowshape.backward")
                                .font(.system(size: 22))
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 20)
                        }
                        Spacer()
                        Button {
                            showingCart = true
                        } label: {
                            Image(systemName: "cart")
                                .font(.system(size: 22))
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 20)
                        }
                    }
                    Spacer()
                }.padding(.horizontal)
            }
        }.sheet(isPresented: $showingCart) {
            CartView(merchant: merchant)
        }
    }
}

#Preview {
    
    MerchantCard(merchant: MockData.merchant, menuItems: MockData.menuItems) {
        
    }.environmentObject(HomeViewModel())
}
