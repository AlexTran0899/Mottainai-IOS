//
//  RestaurantLocationCard.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import SwiftUI

struct RestaurantLocationCard: View {
    var merchant: Merchant;
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Restaurant Location")
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
                Button {
                    if let url = URL(string: "http://maps.apple.com/?address=\(getFullAddress(merchant: merchant).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                                        UIApplication.shared.open(url)
                                    }
                } label: {
                    HStack{
                        Text("Navigate")
                            .font(.headline)
                        Image(systemName: "chevron.right")
                    }.foregroundColor(Color.appPrimaryColor)
                }
            }.padding(.bottom, 8)
            ZStack{
                Color.white.cornerRadius(10)
                .shadow(radius: 3, x:-3, y: 3)
                HStack{
                    Text(getFullAddress(merchant: merchant))
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
            }
        }
    }
    
    func getFullAddress(merchant: Merchant) -> String {
        let addressComponents = [
            merchant.address1,
            merchant.address2,
            merchant.city,
            merchant.state,
            merchant.zipcode
        ]
        
        return addressComponents
            .compactMap { $0 } // Remove nil values
            .joined(separator: ", ")
    }
}



#Preview {
    RestaurantLocationCard(merchant: MockData.merchant)
}
