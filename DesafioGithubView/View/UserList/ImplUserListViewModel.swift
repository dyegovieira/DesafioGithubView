//
//  UserListViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import SwiftUI

final class ImplUserListViewModel: UserListViewModel, ObservableObject {
    
    // MARK: - Init
    
    init(fetchUserListRepository: FetchUserListRepository) {
        self.fetchUserListRepository = fetchUserListRepository
    }
    
    // MARK: - Property
    
    private var fetchUserListRepository: FetchUserListRepository
    @Published var error: ViewError = .none
    @Published var isLoading: Bool = true
    @Published var userList: [User] = [.undefined(), .undefined(), .undefined(), .undefined(), .undefined(), .undefined()]
    
    // MARK: - Funcs
    
    func refreshUserList() {
        isLoading = true
        
        Task {
            do {
                let userList = try await self.fetchUserListRepository.execute()
                DispatchQueue.main.async {
                    self.userList = userList
                    self.isLoading = false
                }
            } catch let error {
                self.error = .message(error.localizedDescription)
            }
        }
    }
}
