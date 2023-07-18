//
//  UserInfoView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//

import SwiftUI

struct UserInfoView: View {
    // MARK: - PROPERTY
    var nodeId:String
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            UserInfoHeaderView()
            
            Group {
                // "bio"
                HStack(alignment: .center, spacing: 20) {
                    VStack(spacing: 5) {
                        
                        Text("Repository") //"public_repos"
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("14")
                    }
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
                    
                    VStack {
                        Text("Followers") //"followers"
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("200")
                    }
                    
                    Divider()
                        .frame(height: 40)
                        .background(Color("AccentColor"))
                    
                    VStack {
                        Text("Following") //"following"
                            .foregroundColor(Color("ReflectAccentColor"))
                        Text("17")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Group {
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.accentColor)
                    Text("email")
                }
                
                HStack {
                    Image(systemName: "bubble.middle.bottom.fill")
                        .foregroundColor(.accentColor)
                    Text("blog")
                }

                HStack {
                    Image(systemName: "bag.fill")
                        .foregroundColor(.accentColor)
                    Text("company")
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
            Spacer()
            
            Group {
                HStack {
                    Text("2022-01-02T06:03:52Z") //"created_at"
                        .foregroundColor(Color("ReflectAccentColor"))
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("2022-01-02T06:03:52Z") //"updated_at":
                        .foregroundColor(Color("ReflectAccentColor"))
                        .font(.caption)
                }
            }
            .padding(.horizontal, 30)
        } //:VSTACK
    } //:BODY
}

struct UserInfoView_Previews: PreviewProvider {
    static var nodeId:String = ""
    static var previews: some View {
        UserInfoView(nodeId: nodeId)
    }
}
