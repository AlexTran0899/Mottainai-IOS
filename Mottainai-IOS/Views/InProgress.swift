//
//  InProgress.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/31/24.
//

import SwiftUI

struct InProgress: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.appBackgroundColor)
            VStack(spacing: 30){
                Spacer()
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.black)
                    .font(.system(size: 100))
                Text("Under Construction")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                Spacer()
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    InProgress()
}
