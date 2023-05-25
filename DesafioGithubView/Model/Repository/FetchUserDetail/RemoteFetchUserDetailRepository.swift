//
//  RemoteFetchUserDetailRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct RemoteFetchUserDetailRepository: FetchUserDetailRepository {
    
    // MARK: - Init
    
    init(httpService: HTTPService) {
        self.httpService = httpService
    }
    
    // MARK: - Property
    
    private var httpService: HTTPService
    
    // MARK: - Func
    
    func execute(login: String) async throws -> UserDetail {
        let urlString = GithubAPI.root + "/users/" + login
        return try await httpService.data(from: urlString)
    }
}
