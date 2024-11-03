//
//  DescriptionCard.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/2/24.
//

import SwiftUI

struct DescriptionCard: View {
    var description: String;
    var body: some View {
        VStack{
            HStack{
                Text("Description")
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
            }
            
            ZStack{
                Color.white.cornerRadius(10)
                .shadow(radius: 3, x:-3, y: 3)
                HStack{
                    Text(description)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DescriptionCard(description: "some very descriptive description")
}
