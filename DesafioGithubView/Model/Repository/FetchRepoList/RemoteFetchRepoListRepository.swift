//
//  RemoteFetchRepoListRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct RemoteFetchRepoListRepository: FetchRepoListRepository {
    
    // MARK: - Init
    
    init(httpService: HTTPService) {
        self.httpService = httpService
    }
    
    // MARK: - Property
    
    private var httpService: HTTPService
    
    // MARK: - Func
    
    func execute(login: String) async throws -> [Repo] {
        let urlString = GithubAPI.root + "/users/\(login)/repos"
        return try await httpService.data(from: urlString)
    }
}
