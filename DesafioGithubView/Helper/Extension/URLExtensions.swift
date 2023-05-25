//
//  URLExtensions.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

extension URL {
    var isValidURL: Bool {
        guard let scheme = self.scheme else { return false }
        let allowedSchemes = ["http", "https"]
        guard allowedSchemes.contains(scheme) else { return false }
        guard let host = self.host else { return false }
        let regex: NSRegularExpression?
        do {
            regex = try? NSRegularExpression(pattern: "[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        }
        let range = NSRange(location: 0, length: host.utf16.count)
        return regex?.firstMatch(in: host, options: [], range: range) != nil
    }
}
