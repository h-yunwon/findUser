//
//  UserInfoHeaderView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/18.
//

// HeaderView
//"name": "JI SOO",
// node_id: "U_kgDOBcej3Q"
//"location": "Seoul, Korea",
// "avatar_url": 사용자 이미지

import SwiftUI

struct UserInfoHeaderView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Text("name")
                .font(.title)
                .fontWeight(.bold)
            Text("node_id")
                .font(.title3)
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(Color("ReflectAccentColor"))
                Text("location")
                    .font(.title3)
            }
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 6)
                .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

struct UserInfoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoHeaderView()
    }
}
