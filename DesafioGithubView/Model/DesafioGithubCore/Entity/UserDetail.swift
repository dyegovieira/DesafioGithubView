//
//  UserDetails.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct UserDetail: Decodable, Identifiable {
    let id: Int
    let login: String
    let name: String?
    let avatar_url: String?
    let location: String?
    let company: String?
    let created_at: String?
    let public_repos: Int?
    let public_gists: Int?
    let followers: Int?
    let following: Int?
}

extension UserDetail {
    init(user: User) {
        id = user.id
        login = user.login
        name = ".................."
        avatar_url = user.avatar_url
        location = "..............."
        company = ".............."
        created_at = nil
        public_repos = 0
        public_gists = 0
        followers = 0
        following = 0
    }
}

// MARK: - JSON Example

/**
 {
   "login": "torvalds",
   "id": 1024025,
   "node_id": "MDQ6VXNlcjEwMjQwMjU=",
   "avatar_url": "https://avatars.githubusercontent.com/u/1024025?v=4",
   "gravatar_id": "",
   "url": "https://api.github.com/users/torvalds",
   "html_url": "https://github.com/torvalds",
   "followers_url": "https://api.github.com/users/torvalds/followers",
   "following_url": "https://api.github.com/users/torvalds/following{/other_user}",
   "gists_url": "https://api.github.com/users/torvalds/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/torvalds/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/torvalds/subscriptions",
   "organizations_url": "https://api.github.com/users/torvalds/orgs",
   "repos_url": "https://api.github.com/users/torvalds/repos",
   "events_url": "https://api.github.com/users/torvalds/events{/privacy}",
   "received_events_url": "https://api.github.com/users/torvalds/received_events",
   "type": "User",
   "site_admin": false,
   "name": "Linus Torvalds",
   "company": "Linux Foundation",
   "blog": "",
   "location": "Portland, OR",
   "email": null,
   "hireable": null,
   "bio": null,
   "twitter_username": null,
   "public_repos": 7,
   "public_gists": 0,
   "followers": 183432,
   "following": 0,
   "created_at": "2011-09-03T15:26:22Z",
   "updated_at": "2023-01-02T22:41:59Z"
 }
*/
