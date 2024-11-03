//
//  LandingView.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/31/24.
//

import SwiftUI

struct LandingView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.appBackgroundColor)
                    VStack(spacing: 30.0){
                        Text("MOTTAI")
                            .foregroundColor(.black)
                            .tracking(1)
                            .font(.system(size: 48, weight: .semibold))
                            .padding(.bottom, -30)
                        ZStack(alignment: .top){
                            Rectangle()
                                .frame(width: 300, height: 3)
                                .foregroundColor(.black)
                            Image("AppIconImage")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(.top, 5)
                                .shadow(radius: 5, x: 0, y: 5)
                        }
                        NavigationLink(destination: HomeView()
                            .environmentObject(HomeViewModel())) {
                            CustomButton(text: "Foodies")
                       }
                        NavigationLink(destination: InProgress()) {
                            CustomButton(text: "Supplier")
                       }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    LandingView()
}
