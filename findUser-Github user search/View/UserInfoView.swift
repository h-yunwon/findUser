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
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            UserInfoHeaderView(userLogin: networkVM.login, userName: networkVM.name, userLocation: networkVM.location, userImageData: networkVM.imageData)
            
            Group {
                HStack(alignment: .center, spacing: 20) {
                    RowView(title: "Repository", value: networkVM.publicRepos)
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
            
                    RowView(title: "Followers", value: networkVM.followers)
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
                    
                    RowView(title: "Following", value: networkVM.following)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Group {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.accentColor)
                    
                    if let unwrappedEmail = networkVM.email {
                        Text(unwrappedEmail)
                            .onTapGesture {
                                UIPasteboard.general.string = unwrappedEmail
                            }
                    } else {
                        Text("No Email")
                    }
                }
                
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(.accentColor)
                    
                    if let unwrappedBlog = networkVM.blog {
                        Link(destination: URL(string: "https://"+unwrappedBlog)!) {
                            Text("\(unwrappedBlog)")
                        }
                    } else {
                        Text("No Blog")
                    }
                }
                
                infoListView(imageSystemName: "bag", text: networkVM.company, fallback: "No Company")
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

struct infoListView: View {
    let imageSystemName: String
    let text: String?
    let fallback: String
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .foregroundColor(.accentColor)
            
            if let unwrappedText = text {
                Text(unwrappedText)
            } else {
                Text(fallback)
            }
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
