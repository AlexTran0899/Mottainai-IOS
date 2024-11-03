//
//  small-card.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/11/24.
//

import SwiftUI

struct MerchantCarouselCard: View {
    var merchant: Merchant;
    var body: some View {
        VStack(spacing: 0){
            URLImageView(imageURL: URL(string: merchant.shopBannerURL)!)
                    .frame(width: 300, height: 110)
                    .clipped()
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                    VStack{
                        HStack{
                            Text(merchant.shopName)
                                .foregroundColor(.black)
                                .font(.headline)
                            Spacer()
                        }.padding(.bottom, 5)
                        HStack{
                            Image(systemName: "figure.walk")
                                .foregroundColor(.black)
                            Text("5 min")
                            Spacer()
                            Image(systemName: "clock")
                            Text(formatTime(merchant.pickupStartTime))
                            Text("-")
                            Text(formatTime(merchant.pickupEndTime))
                        }.foregroundColor(.gray)
                        Spacer()
                    }.padding()
                }.frame(width: 300, height: 90)
            }.frame(width: 300, height: 200)
            .cornerRadius(30)
            .shadow(radius: 3, x:-3, y: 3)
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
    MerchantCarouselCard(merchant: MockData.merchant)
}
