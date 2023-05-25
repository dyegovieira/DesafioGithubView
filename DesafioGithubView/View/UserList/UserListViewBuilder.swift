//
//  UserListViewBuilder.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct UserListViewBuilder {
    var view: UserListView<ImplUserListViewModel> {
        let httpService = URLSessionHTTPService(session: URLSession.shared)
        let repository = RemoteFetchUserListRepository(httpService: httpService)
        let viewModel = ImplUserListViewModel(fetchUserListRepository: repository)
        return UserListView(viewModel: viewModel)
    }
}
