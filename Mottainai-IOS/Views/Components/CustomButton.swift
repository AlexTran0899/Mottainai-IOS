//
//  Button.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/31/24.
//

import SwiftUI

struct CustomButton: View {
    var text: String;
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.appPrimaryColor)
                .cornerRadius(25)
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
        }.frame(width: 200, height: 50)
    }
}

#Preview {
    CustomButton(text: "Hello, World!")
}
