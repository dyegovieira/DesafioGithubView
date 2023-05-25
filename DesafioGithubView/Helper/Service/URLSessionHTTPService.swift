//
//  URLSessionHTTPService.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

struct URLSessionHTTPService: HTTPService {
    
    // MARK: - Init
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    // MARK: - Property
    
    var session: URLSessionProtocol
    
    // MARK: - Func
    
    func data<D: Decodable>(from urlString: String) async throws -> D {
        guard let url = URL(string: urlString), url.isValidURL else {
            throw HTTPServiceError.invalidURL(urlString)
        }
        let (data, _) = try await session.getData(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(D.self, from: data)
    }
}

// MARK: = URL Session Wrapper

protocol URLSessionProtocol {
    func getData(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func getData(from url: URL) async throws -> (Data, URLResponse) {
        return try await data(from: url, delegate: nil)
    }
}
