//
//  FetchUserListRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol FetchUserListRepository {
    func execute() async throws -> [User]
}
