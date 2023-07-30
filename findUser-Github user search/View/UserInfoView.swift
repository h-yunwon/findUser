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
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                UserInfoHeaderView(userLogin: networkVM.login, userName: networkVM.name, userLocation: networkVM.location, userImageData: networkVM.imageData)
                    .padding(.bottom, 20)
                
                Group {
                    if let unwrappedBio = networkVM.bio {
                        Text(unwrappedBio)
                            .font(.title2)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom, 20)
                
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
                .padding(.bottom, 20)
                
                Group {
                    infoListView(imageSystemName: "envelope", text: networkVM.email, fallback: "No Email") { email in
                        UIPasteboard.general.string = email
                    }
                    
                    infoListView(imageSystemName: "link", text: networkVM.blog, fallback: "No Blog") { blog in
                        if blog.lowercased().hasPrefix("https://") {
                            if let url = URL(string: blog) {
                                UIApplication.shared.open(url)
                            }
                        } else {
                            if let url = URL(string: "https://" + blog) {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                    
                    infoListView(imageSystemName: "bag", text: networkVM.company, fallback: "No Company")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                
                Text("\(networkVM.updatedAt.formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(Color("ReflectAccentColor"))
                    .font(.caption)
            } //:VSTACK
            .padding()
        }//: SCROLL
    } //:BODY
}

// MARK: - VIEW
struct RowView: View {
    let title: String
    let value: Int

    var body: some View {
        VStack(spacing: 7) {
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
    let action: ((String) -> Void)?
    
    init(imageSystemName: String, text: String?, fallback: String, action: ((String) -> Void)? = nil) {
        self.imageSystemName = imageSystemName
        self.text = text
        self.fallback = fallback
        self.action = action
    }
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .foregroundColor(.accentColor)
                .frame(width: 30, height: 30)
            
            if text == "" {
                Text(fallback)
            }
            
            if let unwrappedText = text {
                Text(unwrappedText)
                    .onTapGesture {
                        if let action = action {
                            action(unwrappedText)
                        }
                    }
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
