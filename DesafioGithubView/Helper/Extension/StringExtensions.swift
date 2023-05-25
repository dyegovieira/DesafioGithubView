//
//  StringExtensions.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import Foundation

extension String {
    var asDate: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFullDate)
        return formatter.date(from: self)
    }
}
