//
//  ContentView.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import SwiftUI

struct ImagesListView: View {
    @ObservedObject var viewModel: ImagesListViewModel

    var body: some View {
        VStack {
            searchTextField
            if let images = viewModel.images {
                resultScrollView(images)
            } else {
                emptyView
            }
        }
    }
}

// MARK: - Subviews

private extension ImagesListView {

    var searchTextField: some View {
        TextField(LocalizedStringKey("Search"),
                  text: $viewModel.searchTerm,
                  axis: .horizontal)
        .padding()
    }

    var emptyView: some View {
        Group {
            Spacer()
            Text("Search for some images")
            Spacer()
        }
    }

    func resultScrollView(_ images: [ImageItem]) -> some View {
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Constant.spacing) {
                ForEach(images, id: \.self) { item in
                    ImageItemView(imageUrl: viewModel.imageUrl(imageItem: item),
                              name: item.title)
                    Divider()
                }
                Spacer()
            }
        }
    }
}

// MARK: - Constant

private extension ImagesListView {

    struct Constant {
        static let spacing: CGFloat = 0
    }
}

// MARK: - Preview

#Preview {
    let networkService = NetworkService()
    let apiService = ApiService(networkService: networkService)
    let viewModel = ImagesListViewModel(apiService: apiService)
    ImagesListView(viewModel: viewModel)
}
