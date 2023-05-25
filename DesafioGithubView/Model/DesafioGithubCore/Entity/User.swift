//
//  User.swift
//  
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: String?
}

extension User {
    static func undefined() -> User {
        return .init(id: UUID().hashValue, login: "..............", avatar_url: "")
    }
}

// MARK: - JSON Example

/**
 {
   "login": "mojombo",
   "id": 1,
   "node_id": "MDQ6VXNlcjE=",
   "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
   "gravatar_id": "",
   "url": "https://api.github.com/users/mojombo",
   "html_url": "https://github.com/mojombo",
   "followers_url": "https://api.github.com/users/mojombo/followers",
   "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
   "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
   "organizations_url": "https://api.github.com/users/mojombo/orgs",
   "repos_url": "https://api.github.com/users/mojombo/repos",
   "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
   "received_events_url": "https://api.github.com/users/mojombo/received_events",
   "type": "User",
   "site_admin": false
 }
 */
