//
//  FImagesListViewModel.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Combine
import Foundation

final class ImagesListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
//    @Published
    @Published var images: [ImageItem]?
    private var apiService: ApiServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
        observeSearches()
    }

    func imageUrl(imageItem: ImageItem) -> URL? {
        do {
            return try apiService.imageUrl(imageItem: imageItem)
        } catch {
            print("\(error)")
            return nil
        }
    }
}

extension ImagesListViewModel {

    enum ViewState {
        case empty
        case images([ImageItem])
        case loading
    }
}

// MARK: - Private

private extension ImagesListViewModel {

    func observeSearches() {
        $searchTerm
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink(receiveValue: self.searchImages)
            .store(in: &cancellables)
    }

    func searchImages(_ text: String) {
        Task { @MainActor in
            do {
                self.images = try await self.apiService.fetchImageItems(text: text)
            } catch {
                print("fetching images error \(error)")
            }
        }
    }
}
