//
//  HeaderView.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/12.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        Image("GithubLogo")
            .resizable()
            .frame(maxWidth: .infinity)
            .scaledToFit()
            .padding(.horizontal, 80)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
