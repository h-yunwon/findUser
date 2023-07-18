//
//  SearchBarView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - PROPERTY
    @Binding var searchText: String
    @Binding var showProfile: Bool
    // MARK: BODY
    var body: some View {
        HStack {
            TextField("Enter Github User",
                      text: $searchText,
                      onEditingChanged: { isEditing in
//                isFormValid = !searchSummonerName.isEmpty
            })
                .font(.headline)
                .foregroundColor(Color("ColorSearchBar"))
                .textFieldStyle(DefaultTextFieldStyle())
            
            Spacer()
            
            Button(action: {
                searchText = ""
                showProfile = true
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(Color("ColorSearchBar"))
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color("ColorSearchBar"), lineWidth: 2)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static private var searchText:String = ""
    @State static private var showProfile:Bool = false
    static var previews: some View {
        SearchBarView(searchText: $searchText, showProfile: $showProfile)
    }
}
