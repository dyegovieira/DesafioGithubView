//
//  UserDetailViewBuilder.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct UserDetailViewBuilder {
    let user: User
    
    var view: UserDetailView<ImplUserDetailViewModel> {
        let httpService = URLSessionHTTPService(session: URLSession.shared)
        let repository = RemoteFetchUserDetailRepository(httpService: httpService)
        let viewModel = ImplUserDetailViewModel(user: user, fetchUserDetailRepository: repository)
        return UserDetailView(viewModel: viewModel)
    }
}
