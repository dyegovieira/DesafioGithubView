//
//  ImplRepoListViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

final class ImplRepoListViewModel: RepoListViewModel, ObservableObject {
    
    // MARK: - Init
    
    init(login: String, fetchRepoListRepository: FetchRepoListRepository) {
        self.login = login
        self.fetchRepoListRepository = fetchRepoListRepository
    }
    
    // MARK: - Property

    private var fetchRepoListRepository: FetchRepoListRepository
    @Published var error: ViewError = .none
    @Published var isLoading: Bool = true
    @Published var repoList: [Repo] = [.undefined(), .undefined(), .undefined()]
    @Published var login: String = ""
    
    // MARK: - Funcs
    
    func refreshRepoList() {
        isLoading = true
        
        Task {
            do {
                let repoList = try await self.fetchRepoListRepository.execute(login: self.login)
                
                DispatchQueue.main.async {
                    self.repoList = repoList
                    self.isLoading = false
                }
            } catch let error {
                DispatchQueue.main.async {
                    self.error = .message(error.localizedDescription)
                }
            }
        }
    }
}
