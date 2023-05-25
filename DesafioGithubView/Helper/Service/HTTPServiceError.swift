//
//  HTTPServiceError.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import Foundation

enum HTTPServiceError: Error, LocalizedError {
    case invalidURL(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let value): return "URL Inválida. (\(value))"
        }
    }
}
