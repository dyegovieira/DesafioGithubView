//
//  UserDetailViewModel.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

protocol UserDetailViewModel: ObservableObject {
    var error: ViewError { get set }
    var isLoading: Bool { get set }
    var userDetail: UserDetail { get set }
    
    func refreshUserDetail()
}
