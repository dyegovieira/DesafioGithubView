//
//  ViewError.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

enum ViewError: LocalizedError, Equatable {
    case none
    case message(String)
    
    var errorDescription: String? {
        switch self {
        case .none: return "none"
        case .message(let value): return value
        }
    }
}
