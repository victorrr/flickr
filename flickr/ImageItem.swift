//
//  ImageItem.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Foundation

struct ImageItem: Decodable, Hashable {
    let id: String
    let server: String
    let secret: String
    let title: String
}

struct PhotosResponse: Decodable {
    let photos: Photos
}

struct Photos: Decodable {
    let photo: [ImageItem]
}
