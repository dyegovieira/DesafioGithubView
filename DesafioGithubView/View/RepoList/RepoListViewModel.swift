//
//  RepoListViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol RepoListViewModel: ObservableObject {
    var error: ViewError { get set }
    var isLoading: Bool { get set }
    var repoList: [Repo] { get set }
    var login: String { get set }
    
    func refreshRepoList()
}
