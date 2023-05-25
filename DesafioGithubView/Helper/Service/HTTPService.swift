//
//  HTTPService.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol HTTPService {
    func data<D: Decodable>(from urlString: String) async throws -> D
}
