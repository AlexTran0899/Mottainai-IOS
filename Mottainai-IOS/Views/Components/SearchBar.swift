//
//  SearchBar.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/11/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        HStack {
              TextField("", text: $searchText)
                .foregroundColor(.black)
                  .padding(20)
                  .padding(.leading, 30)
                  .background(Color(.white)
                    .onTapGesture {
                        withAnimation {
                            isTextFieldFocused = true
                        }
                    })
                  .cornerRadius(40)
                  .shadow(radius: isTextFieldFocused ? 10 : 3)
                  .animation(.spring(), value: isTextFieldFocused)
                  .focused($isTextFieldFocused)
                  .overlay(
                      HStack {
                          Image(systemName: "magnifyingglass")
                              .foregroundColor(.gray)
                              .padding(.leading, 20)
                          if searchText.isEmpty {
                              Text("Search... ")
                                  .foregroundColor(.gray)
                          }
                          Spacer()
                      }   .onTapGesture {
                          withAnimation {
                              isTextFieldFocused = true
                          }
                      }
                  )
          }
    }
}

#Preview {
    ZStack{
        Rectangle()
            .fill(Color.appBackgroundColor)
        SearchBar()
    }
    
}
