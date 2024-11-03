//
//  QuickSearchIcon.swift
//  Mottainai-IOS
//
//  Created by 1234 on 11/1/24.
//

import SwiftUI

struct QuickSearchIcon: View {
    var text: String;
    var body: some View {
        HStack {
              Text(text)
                  .padding(10)
                  .padding(.leading, 25)
                  .padding(.trailing, 10)
                  .background(Color(.white))
                  .cornerRadius(40)
                  .shadow(radius: 2, x:-2, y: 2)
                  .foregroundColor(.gray)
                  .overlay(
                      HStack {
                          Image(systemName: "magnifyingglass")
                              .foregroundColor(.gray)
                              .padding(.leading, 10)
                          Spacer()
                      }
                  )
        }
    }
}

#Preview {
    QuickSearchIcon(text: "Near me")
}
