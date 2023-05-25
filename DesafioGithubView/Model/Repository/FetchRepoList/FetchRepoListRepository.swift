//
//  FetchRepoListRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol FetchRepoListRepository {
    func execute(login: String) async throws -> [Repo]
}
