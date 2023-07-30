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
    
    // MARK: - FUNCTION
    func safeDisplay(_ text: String?) -> Text? {
        if let unwrappedText = text {
            return Text(unwrappedText)
        }
        
        return nil
    }
    
    func displayUserImage(_ userImageData: Data?) -> Image {
        if let imageData = userImageData,
           let image = UIImage(data: imageData) {
            return Image(uiImage: image)
            
        } else {
            return Image(systemName: "person.crop.circle.fill")
        }
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Text("\(userLogin)")
                .font(.title)
                .fontWeight(.bold)
            
            safeDisplay(userName)
                .font(.title3)
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(Color("ReflectAccentColor"))
                safeDisplay(userLocation)
                    .font(.title3)
            }//: HSTACK
            
            displayUserImage(userImageData)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 6)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 60)
                .padding(.top, 20)
            
        }//: VSTACK
    }//: BODY
}

// MARK: - PREVIEW
struct UserInfoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoHeaderView(userLogin: "", userName: nil, userLocation: nil)
    }
}
