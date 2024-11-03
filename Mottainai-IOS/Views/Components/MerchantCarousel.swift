//
//  HorizontalCarousel .swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/11/24.
//

import SwiftUI

struct MerchantCarousel: View {
    var text: String
    var merchants: [Merchant];
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
                    .bold()
                Spacer()
                Button {
                    print("pressed")
                } label: {
                    HStack{
                        Text("See more")
                            .font(.headline)
                        Image(systemName: "chevron.right")
                    }.foregroundColor(Color.appPrimaryColor)
                        .padding(.trailing)
                }
            }.padding(.leading)
                .padding([.bottom, .top], 8)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(merchants) { merchant in
                        MerchantCarouselCard(merchant: merchant)
                            .onTapGesture {
                                homeViewModel.setSelectedMerchant(merchant: merchant)
                            }
                    }
                }.padding(.leading)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    MerchantCarousel(text: "Have you seen these?", merchants: MockData.merchants)
        .environmentObject(HomeViewModel())
}
