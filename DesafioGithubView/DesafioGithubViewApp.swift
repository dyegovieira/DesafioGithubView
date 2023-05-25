//
//  DesafioGithubViewApp.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import SwiftUI

@main
struct DesafioGithubViewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserListViewBuilder().view
            }
        }
    }
}
