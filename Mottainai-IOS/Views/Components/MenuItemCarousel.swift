//
//  MenuItemCarousel.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import SwiftUI

struct MenuItemCarousel: View {
    var menuItems: [MenuItem];
    var body: some View {
        VStack{
            HStack{
                Text("Food Available")
                    .foregroundColor(.black)
                    .font(.headline)
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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(menuItems) { menuItem in
                        MenuItemCarouselCard(menuItem: menuItem)
                    }
                }
                .padding(.leading)
                .padding(.bottom)
            }
        }
        
    }
}

#Preview {
    MenuItemCarousel(menuItems: MockData.menuItems)
        .environmentObject(HomeViewModel())
}
