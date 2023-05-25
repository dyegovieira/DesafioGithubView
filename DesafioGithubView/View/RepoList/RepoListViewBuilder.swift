//
//  RepoListViewBuilder.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct RepoListViewBuilder {
    let login: String
    
    var view: RepoListView<ImplRepoListViewModel> {
        let httpService = URLSessionHTTPService(session: URLSession.shared)
        let repository = RemoteFetchRepoListRepository(httpService: httpService)
        let viewModel = ImplRepoListViewModel(login: login, fetchRepoListRepository: repository)
        return RepoListView(viewModel: viewModel)
    }
}
