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
    
    // MARK: - PROPERTY
    var userLogin: String = ""
    var userName: String? = nil
    var userLocation: String? = nil
    var userImageData: Data? = nil
    
    // MARK: - PROPERTY
    func safeDisplay(_ text: String?, fallback: String) -> Text {
        if let unwrappedText = text {
            return Text(unwrappedText)
        } else {
            return Text(fallback)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Text("\(userLogin)")
                .font(.title)
                .fontWeight(.bold)
            
            safeDisplay(userName, fallback: "")
                .font(.title3)
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(Color("ReflectAccentColor"))
                safeDisplay(userLocation, fallback: "")
                    .font(.title3)
            }
            
            if let imageData = userImageData,
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 6)
                    .padding()
                    .frame(maxHeight: .infinity)
                
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 6)
                    .padding()
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct UserInfoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoHeaderView(userLogin: "", userName: nil, userLocation: nil)
    }
}
