//
//  ContentView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var searchText = ""
    @State private var showProfile = false
    @State private var selectedNodeID = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView()
                SearchBarView(searchText: $searchText, showProfile: $showProfile)
                NavigationLink(
                    destination: UserInfoView(nodeId: selectedNodeID),
                    isActive: $showProfile
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("GitSearch")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
