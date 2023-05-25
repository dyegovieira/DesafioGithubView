//
//  UserDetailViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

final class ImplUserDetailViewModel: UserDetailViewModel, ObservableObject {
    
    // MARK: - Init
    
    init(user: User, fetchUserDetailRepository: FetchUserDetailRepository) {
        userDetail = .init(user: user)
        self.fetchUserDetailRepository = fetchUserDetailRepository
    }
    
    // MARK: - Property
    
    private var fetchUserDetailRepository: FetchUserDetailRepository
    @Published var userDetail: UserDetail
    @Published var error: ViewError = .none
    @Published var isLoading: Bool = true
    
    // MARK: - Funcs
    
    func refreshUserDetail() {
        isLoading = true
        
        Task {
            do {
                let userDetail = try await self.fetchUserDetailRepository.execute(login: self.userDetail.login)
                
                DispatchQueue.main.async {
                    self.userDetail = userDetail
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
