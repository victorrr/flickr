//
//  flickrApp.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import SwiftUI

@main
struct flickrApp: App {
    var body: some Scene {
        WindowGroup {
            FImagesListView(viewModel: viewModel)
        }
    }

    private var viewModel: FImagesListViewModel {
        let networkService = NetworkService()
        let apiService = ApiService(networkService: networkService)
        return FImagesListViewModel(apiService: apiService)
    }
}
