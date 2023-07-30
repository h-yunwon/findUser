//
//  NetworkViewModel.swift
//  findUser-Github user search
//
//  Created by Yunwon Han on 2023/07/27.
//

import Foundation

class NetworkViewModel:ObservableObject {
    
    @Published var userInfo: [UserInfoModel] = []
    @Published var login: String = ""
    @Published var imageData: Data? = nil
    @Published var name: String? = nil
    @Published var company: String? = nil
    @Published var blog: String? = nil
    @Published var location: String? = nil
    @Published var email: String? = nil
    @Published var publicRepos: Int = 0
    @Published var followers: Int = 0
    @Published var following: Int = 0
    @Published var updatedAt: Date = Date()
    @Published var bio: String? = nil

//    @Published var hireable: String? = nil
//    @Published var twitterUsername: String? = nil
//    @Published var publicGists: Int = 0
//    @Published var createdAt: Date = Date()
    //    let id: Int
    //    let nodeID: String
    //    let gravatarID: String
    //    let url, htmlURL, followersURL: String
    //    let followingURL, gistsURL, starredURL: String
    //    let subscriptionsURL, organizationsURL, reposURL: String
    //    let eventsURL: String
    //    let receivedEventsURL: String
    //    let type: String
    //    let siteAdmin: Bool

    // 클로저를 파라미터로 갖는 fetchUserInfo 메서드 정의
    func fetchUserInfo(login: String, completion: @escaping (Bool) -> Void) {

        guard let url = URL(string: "https://api.github.com/users/\(login)") else {
            print("Invalid URL")
            completion(false)
            return
        }
        
        // URLSession을 사용하여 API 요청 및 데이터 처리
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let infoData = try decoder.decode(UserInfoModel.self, from: data)
        
                if let imageUrl = URL(string: infoData.avatarURL),
                   let imageData = try? Data(contentsOf: imageUrl) {
                    
                    DispatchQueue.main.async {
                        self.login = login
                        self.imageData = imageData
                        self.name = infoData.name
                        self.company = infoData.company
                        self.blog = infoData.blog
                        self.location = infoData.location
                        self.email = infoData.email
                        self.publicRepos = infoData.publicRepos
                        self.followers = infoData.followers
                        self.following = infoData.following
                        self.updatedAt = infoData.updatedAt
                        self.bio = infoData.bio
    //                    self.hireable = infoData.hireable
    //                    self.twitterUsername = infoData.twitterUsername
    //                    self.publicGists = infoData.publicGists
    //                    self.createdAt = infoData.createdAt
                        
                        completion(true) // 성공 시 클로저 호출
                    }
                }
            }   catch {
                print("fetchUserInfo - Error decoding JSON: \(error.localizedDescription)")
                completion(false) // 실패 시 클로저 호출
            }
        }.resume()
    }
}







