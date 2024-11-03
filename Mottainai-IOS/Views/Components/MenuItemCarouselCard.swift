//
//  MenuItemCarouselCard.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import SwiftUI

struct MenuItemCarouselCard: View {
    var menuItem: MenuItem;
    @EnvironmentObject var homeViewModel: HomeViewModel;
    
    @State private var plusTapped = false
    @State private var minusTapped = false
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                // Display the image using URLImageView (assuming this is a custom view that loads images from URLs)
                URLImageView(imageURL: URL(string: menuItem.imageUrl)!)
                    .frame(width: 250, height: 150)
//                    .clipped()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    
                    VStack {
                        HStack {
                            Text(menuItem.itemTitle)
                                .font(.headline)
                                .foregroundColor(.black)
                        }.padding(.bottom, 5)
                    }
                    .padding()
                }
            }
            VStack{
                HStack{
                    Text("\(getPrice(menuItem: menuItem)) \(homeViewModel.isItemInCart(menuItem: menuItem) ? " x \(homeViewModel.getItemQuanity(menuItem: menuItem))" : "" )")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                        .padding(5)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(.infinity)
                        .shadow(color: .black, radius: 10)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            
            
            VStack{
                HStack {
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .frame(width: 45, height: 45)
                        .foregroundColor(.black)
                        .background(Color.white.cornerRadius(.infinity).shadow(color: .black, radius: 10))
                        .scaleEffect(plusTapped ? 1.4 : 1.0)
                        .animation(.spring(), value: plusTapped)
                        .onLongPressGesture(minimumDuration: 0) {
                            withAnimation {
                               plusTapped = true
                           }
                            homeViewModel.addItemToCart(menuItem: menuItem)
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                               withAnimation {
                                   plusTapped = false
                               }
                           }
                        }
                }.padding([.horizontal, .vertical])
                if homeViewModel.isItemInCart(menuItem: menuItem) {
                    HStack {
                        Spacer()
                        Image(systemName: "minus")
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 45, height: 45)
                            .foregroundColor(.black)
                            .background(Color.white.cornerRadius(.infinity).shadow(color: .black, radius: 10))
                            .scaleEffect(minusTapped ? 1.3 : 1.0)
                            .animation(.spring(), value: plusTapped)
                            .onLongPressGesture(minimumDuration: 0) {
                                withAnimation {
                                    minusTapped = true
                               }
                                homeViewModel.decrementItemFromCart(menuItem: menuItem)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                   withAnimation {
                                       minusTapped = false
                                   }
                               }
                            }
                    }.padding(.horizontal)
                }
                Spacer()
            }
        }
        .frame(width: 250, height: 200)
        .cornerRadius(20)
        .shadow(radius: 3, x: -3, y: 3)
    }
    func getPrice(menuItem: MenuItem) -> String {
        let priceInDollars = Double(menuItem.price) / 100
        return String(format: "$%.2f", priceInDollars)
    }
}

#Preview {
    MenuItemCarouselCard(menuItem: MockData.menuItem)
        .environmentObject(HomeViewModel())
}
