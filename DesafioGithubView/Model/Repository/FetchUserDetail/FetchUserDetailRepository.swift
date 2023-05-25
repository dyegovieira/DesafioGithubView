//
//  FetchUserDetailRepository.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol FetchUserDetailRepository {
    func execute(login: String) async throws -> UserDetail
}
