//
//  UserListView.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 23/05/23.
//

import SwiftUI

struct UserListView<ViewModel>: View where ViewModel: UserListViewModel {
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Property
    
    @ObservedObject private var viewModel: ViewModel
    @State private var isErrorAlertPresenting: Bool = false
    @State private var searchText = ""
    
    private var filteredUserList: [User] {
        if searchText.isEmpty {
            return viewModel.userList
        } else {
            return viewModel.userList.filter({ $0.login.contains(searchText.lowercased()) })
        }
    }
    
    // MARK: - Layout
    
    var body: some View {
        List {
            ForEach(filteredUserList) { item in
                NavigationLink {
                    UserDetailViewBuilder(user: item).view
                } label: {
                    buildItemView(user: item)
                }
                .accessibilityHidden(viewModel.isLoading)
                .disabled(viewModel.isLoading)
            }
        }
        .searchable(text: $searchText, prompt: "Procure pelo nome de usuário")
        .refreshable {
            viewModel.refreshUserList()
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .navigationTitle("Usuários")
        .onAppear(perform: viewModel.refreshUserList)
        .onChange(of: viewModel.error, perform: { value in
            isErrorAlertPresenting = value.localizedDescription.isEmpty == false
        })
        .alert(isPresented: $isErrorAlertPresenting, error: viewModel.error, actions: { _ in }, message: { _ in })
    }
    
    private func buildItemView(user: User) -> some View {
        HStack {
            AsyncImage(url: URL(string: user.avatar_url ?? "-")) { phase in
                Group {
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(systemName: SystemImageName.person)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .frame(width: 32, height: 32)
            .unredacted()
            .clipShape(Circle())
            
            Text(user.login)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}
