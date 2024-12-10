//
//  ImageItem.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Foundation

// MARK: - ImageItem

struct ImageItem: Decodable, Hashable {
    let id: String
    let server: String
    let secret: String
    let title: String
}

// MARK: - PhotosResponse

struct PhotosResponse: Decodable {
    let photos: Photos
}

// MARK: - Photos

struct Photos: Decodable {
    let photo: [ImageItem]
}
