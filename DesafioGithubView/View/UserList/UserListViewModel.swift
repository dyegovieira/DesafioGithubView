//
//  UserListViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol UserListViewModel: ObservableObject {
    var error: ViewError { get set }
    var isLoading: Bool { get set }
    var userList: [User] { get set }
    
    func refreshUserList()
}
