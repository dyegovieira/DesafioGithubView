//
//  Repo.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct Repo: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int?
    let watchers_count: Int?
    let forks_count: Int?
}

extension Repo {
    static func undefined() -> Repo {
        return .init(id: UUID().hashValue,
                     name: "..........",
                     description: "............................",
                     stargazers_count: 0,
                     watchers_count: 0,
                     forks_count: 0)
    }
}

// MARK: - JSON Example
/**
 {
     "id": 79171906,
     "node_id": "MDEwOlJlcG9zaXRvcnk3OTE3MTkwNg==",
     "name": "libdc-for-dirk",
     "full_name": "torvalds/libdc-for-dirk",
     "private": false,
     "owner": {
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
       "site_admin": false
     },
     "html_url": "https://github.com/torvalds/libdc-for-dirk",
     "description": "Only use for syncing with Dirk, don't use for anything else",
     "fork": true,
     "url": "https://api.github.com/repos/torvalds/libdc-for-dirk",
     "forks_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/forks",
     "keys_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/keys{/key_id}",
     "collaborators_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/collaborators{/collaborator}",
     "teams_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/teams",
     "hooks_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/hooks",
     "issue_events_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/issues/events{/number}",
     "events_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/events",
     "assignees_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/assignees{/user}",
     "branches_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/branches{/branch}",
     "tags_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/tags",
     "blobs_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/git/blobs{/sha}",
     "git_tags_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/git/tags{/sha}",
     "git_refs_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/git/refs{/sha}",
     "trees_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/git/trees{/sha}",
     "statuses_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/statuses/{sha}",
     "languages_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/languages",
     "stargazers_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/stargazers",
     "contributors_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/contributors",
     "subscribers_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/subscribers",
     "subscription_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/subscription",
     "commits_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/commits{/sha}",
     "git_commits_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/git/commits{/sha}",
     "comments_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/comments{/number}",
     "issue_comment_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/issues/comments{/number}",
     "contents_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/contents/{+path}",
     "compare_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/compare/{base}...{head}",
     "merges_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/merges",
     "archive_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/{archive_format}{/ref}",
     "downloads_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/downloads",
     "issues_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/issues{/number}",
     "pulls_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/pulls{/number}",
     "milestones_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/milestones{/number}",
     "notifications_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/notifications{?since,all,participating}",
     "labels_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/labels{/name}",
     "releases_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/releases{/id}",
     "deployments_url": "https://api.github.com/repos/torvalds/libdc-for-dirk/deployments",
     "created_at": "2017-01-17T00:25:49Z",
     "updated_at": "2023-05-07T20:51:28Z",
     "pushed_at": "2023-03-16T22:13:15Z",
     "git_url": "git://github.com/torvalds/libdc-for-dirk.git",
     "ssh_url": "git@github.com:torvalds/libdc-for-dirk.git",
     "clone_url": "https://github.com/torvalds/libdc-for-dirk.git",
     "svn_url": "https://github.com/torvalds/libdc-for-dirk",
     "homepage": "",
     "size": 3780,
     "stargazers_count": 192,
     "watchers_count": 192,
     "language": "C",
     "has_issues": false,
     "has_projects": true,
     "has_downloads": true,
     "has_wiki": true,
     "has_pages": false,
     "has_discussions": false,
     "forks_count": 51,
     "mirror_url": null,
     "archived": false,
     "disabled": false,
     "open_issues_count": 1,
     "license": {
       "key": "lgpl-2.1",
       "name": "GNU Lesser General Public License v2.1",
       "spdx_id": "LGPL-2.1",
       "url": "https://api.github.com/licenses/lgpl-2.1",
       "node_id": "MDc6TGljZW5zZTEx"
     },
     "allow_forking": true,
     "is_template": false,
     "web_commit_signoff_required": false,
     "topics": [

     ],
     "visibility": "public",
     "forks": 51,
     "open_issues": 1,
     "watchers": 192,
     "default_branch": "Subsurface-branch"
   }
 */
