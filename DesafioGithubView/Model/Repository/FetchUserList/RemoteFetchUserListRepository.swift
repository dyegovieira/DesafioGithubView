//
//  RemoteFetchUserListRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import Foundation

struct RemoteFetchUserListRepository: FetchUserListRepository {
    
    // MARK: - Init
    
    init(httpService: HTTPService) {
        self.httpService = httpService
    }
    
    // MARK: - Property
    
    private var httpService: HTTPService
    
    // MARK: - Func
    
    func execute() async throws -> [User] {
        let urlString = GithubAPI.root + "/users"
        return try await httpService.data(from: urlString)
    }
}
