//
//  CartView.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/3/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel;
    
    var merchant: Merchant;
    var body: some View {
            VStack{
                Text("Shopping Cart")
                    .font(.title3)
                    .bold()
                    .padding()
                HStack{
                    CartItemCarousel(merchant: merchant)
                }
                RestaurantLocationCard(merchant: merchant)
                    .padding()
                    .frame(maxHeight: 150)
                HStack{
                    Text("Pick up time: ")
                        .bold()
                    Spacer()
                    Text("\(formatTime(merchant.pickupStartTime)) - \(formatTime(merchant.pickupEndTime))")
                }.padding()
                HStack{
                    Text("Order Total: ")
                        .bold()
                    Spacer()
                    Text(getTotal(merchant: merchant))
                }.padding()
                Spacer()
                ZStack{
                    Color.black
                        .cornerRadius(20)
                    Button {
                        print("place order")
                    } label: {
                        Text("Place Order")
                            .foregroundColor(.white)
                            .font(.system(size: 28,weight: .bold))
                    }
                }.frame(maxHeight: 60)
                    .padding()
            }
    }
    
    func getTotal(merchant: Merchant) -> String {
        let cartItems = homeViewModel.getCartItemFromCartByMerchant(merchant: merchant)
        var total = 0
        for cartItem in cartItems {
            total += cartItem.count * cartItem.menuItem.price
        }
        return getPrice(price: total)
    }
    
    func getPrice(price: Int) -> String {
        let priceInDollars = Double(price) / 100
        return String(format: "$%.2f", priceInDollars)
    }
    
    func formatTime(_ timeString: String) -> String {
        // Step 1: Parse the original time string
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm:ss"
        
        guard let date = inputFormatter.date(from: timeString) else {
            return "" // Return nil if the date parsing fails
        }
        
        // Step 2: Format the date to "HH:mm"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        
        return outputFormatter.string(from: date)
    }
}

#Preview {
    CartView(merchant: MockData.merchant)
        .environmentObject(HomeViewModel())
}
