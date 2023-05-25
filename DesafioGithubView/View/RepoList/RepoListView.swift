//
//  RepoListView.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import SwiftUI

struct RepoListView<ViewModel>: View where ViewModel: RepoListViewModel {
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Property
    
    @ObservedObject private var viewModel: ViewModel
    @State private var isErrorAlertPresenting: Bool = false
    
    // MARK: - Layout
    
    var body: some View {
        List {
            ForEach(viewModel.repoList) { item in
                buildItemView(repo: item)
            }
        }
        .refreshable {
            viewModel.refreshRepoList()
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .navigationTitle("Repos de \(viewModel.login)")
        .onAppear(perform: viewModel.refreshRepoList)
        .onChange(of: viewModel.error, perform: { value in
            isErrorAlertPresenting = value.localizedDescription.isEmpty == false
        })
        .alert(isPresented: $isErrorAlertPresenting, error: viewModel.error, actions: { _ in }, message: { _ in })
    }
    
    private func buildItemView(repo: Repo) -> some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.caption)
                .foregroundColor(.primary)
            
            HStack {
                miniPanel(imageName: SystemImageName.star, value: repo.stargazers_count)
                Divider()
                miniPanel(imageName: SystemImageName.watcher, value: repo.watchers_count)
                Divider()
                miniPanel(imageName: SystemImageName.fork, value: repo.forks_count)
            }
            .frame(height: 16)
            
            Text(repo.description ?? "---")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
    
    private func miniPanel(imageName: String, value: Int?) -> some View {
        HStack(spacing: 4) {
            Image(systemName: imageName)
                .foregroundColor(.secondary)
                .frame(height: 8)
            Text((value ?? 0).asString)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}
