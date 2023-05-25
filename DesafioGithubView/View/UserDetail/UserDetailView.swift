//
//  UserDetailView.swift
//  DesafioGithubView
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import SwiftUI

struct UserDetailView<ViewModel>: View where ViewModel: UserDetailViewModel {
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Property
    
    @ObservedObject private var viewModel: ViewModel
    @State private var isErrorAlertPresenting: Bool = false
    
    // MARK: - Layout
    
    var body: some View {
        Form {
            headerSectionView
            infoSectionView
            reposSectionView
            footerSectionView
        }
        .refreshable {
            viewModel.refreshUserDetail()
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .navigationTitle(viewModel.userDetail.login)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.refreshUserDetail)
        .onChange(of: viewModel.error, perform: { value in
            isErrorAlertPresenting = value.localizedDescription.isEmpty == false
        })
        .alert(isPresented: $isErrorAlertPresenting, error: viewModel.error, actions: { _ in }, message: { _ in })
    }
    
    private var headerSectionView: some View {
        HStack {
            VStack(alignment: .leading) {
                if let value = viewModel.userDetail.name {
                    Text(value)
                        .foregroundColor(.primary)
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack(spacing: 2) {
                    Text("\(viewModel.userDetail.followers ?? 0) folowers")
                        .font(.caption2)
                        .foregroundColor(Color.secondary)
                    
                    Text("\(viewModel.userDetail.following ?? 0) following")
                        .font(.caption2)
                        .foregroundColor(Color.secondary)
                }
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: viewModel.userDetail.avatar_url ?? "-")) { phase in
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
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .frame(width: 128, height: 128)
        }
    }
    
    private var infoSectionView: some View {
        Section {
            if let value = viewModel.userDetail.location {
                Label(value, systemImage: SystemImageName.location)
                    .foregroundColor(Color.secondary)
            }
            
            if let value = viewModel.userDetail.company {
                Label(value, systemImage: SystemImageName.company)
                    .foregroundColor(Color.secondary)
            }
        }
    }
    
    private var reposSectionView: some View {
        Group {
            if let value  = viewModel.userDetail.public_repos, value > 0 {
                Section {
                    NavigationLink {
                        RepoListViewBuilder(login: viewModel.userDetail.login).view
                    } label: {
                        Label("Repos (\(value))", systemImage: SystemImageName.repository)
                            .foregroundColor(Color.primary)
                    }
                    .accessibilityHidden(viewModel.isLoading)
                    .disabled(viewModel.isLoading)
                }
            } else {
                Text("Repos (0)")
            }
        }
    }
    
    private var footerSectionView: some View {
        Group {
            if let value = viewModel.userDetail.created_at?.asDate {
                Text("Desde \(value)")
                    .font(.caption2)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}
