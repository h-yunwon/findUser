//
//  UserInfoView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//

import SwiftUI

struct UserInfoView: View {
    
    // MARK: - PROPERTY
    @ObservedObject var networkVM: NetworkViewModel
    
    // MARK: - FUNCTION
    func safeDisplay(_ text: String?, fallback: String) -> Text {
        if let unwrappedText = text {
            return Text(unwrappedText)
        } else {
            return Text(fallback)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            UserInfoHeaderView(userLogin: networkVM.login, userName: networkVM.name, userLocation: networkVM.location)
            
            Group {

                HStack(alignment: .center, spacing: 20) {
                    VStack(spacing: 5) {
                        
                        Text("Repository")
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("\(networkVM.publicRepos)")
                    }
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
                    
                    VStack {
                        Text("Followers")
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("\(networkVM.followers)")
                    }
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
                    
                    VStack {
                        Text("Following")
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("\(networkVM.following)")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Group {
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.accentColor)
                    safeDisplay(networkVM.email, fallback: "No Email")
                }
                
                HStack {
                    Image(systemName: "bubble.middle.bottom.fill")
                        .foregroundColor(.accentColor)
                    
                    safeDisplay(networkVM.blog, fallback: "No Blog")
                }

                HStack {
                    Image(systemName: "bag.fill")
                        .foregroundColor(.accentColor)
                    
                    safeDisplay(networkVM.company, fallback: "No Company")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            
            Button(action: {
                // Follow Button Action
            }) {
                Text("Follow")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color("AccentColor"))
                    .cornerRadius(17)
            }
            .padding()
            
            Text("\(networkVM.updatedAt.formatted(date: .abbreviated, time: .shortened))")
                .foregroundColor(Color("ReflectAccentColor"))
                .font(.caption)
        } //:VSTACK
    } //:BODY
}

// MARK: - VIEW
struct RowView: View {
    let title: String
    let value: Int

    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .foregroundColor(Color("ReflectAccentColor"))
            Text("\(value)")
        }
    }
}


// MARK: - PREVIEW
struct UserInfoView_Previews: PreviewProvider {
    @ObservedObject static private var networkVM: NetworkViewModel = NetworkViewModel()
    static var nodeId:String = ""
    static var previews: some View {
        UserInfoView(networkVM: networkVM)
    }
}
