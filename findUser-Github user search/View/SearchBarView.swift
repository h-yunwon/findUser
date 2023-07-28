//
//  SearchBarView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - PROPERTY
    @ObservedObject var networkVM: NetworkViewModel
    @Binding var searchText: String
    @Binding var showProfile: Bool
//    @State private var isFormValid = false
    
    // MARK: BODY
    var body: some View {
        HStack {
            TextField("Enter Github User",
                      text: $searchText,
                      onEditingChanged: { isEditing in
//                isFormValid = !searchText.isEmpty
            })
                .font(.headline)
                .foregroundColor(Color("ColorSearchBar"))
                .textFieldStyle(DefaultTextFieldStyle())
            
            Spacer()
            
            Button(action: {
                networkVM.fetchUserInfo(login: searchText) { success in
                    showProfile = success
                }
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
    @ObservedObject static private var networkVM: NetworkViewModel = NetworkViewModel()
    @State static private var searchText:String = ""
    @State static private var showProfile:Bool = false
    static var previews: some View {
        SearchBarView(networkVM: networkVM, searchText: $searchText, showProfile: $showProfile)
    }
}
