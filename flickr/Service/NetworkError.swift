//
//  NetworkError.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case failedToDecodeResponse
    case invalidUrl
    case noImages

    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            "invalid_response".localized
        case .failedToDecodeResponse:
            "failed_to_decode_response".localized
        case .invalidUrl:
            "invalid_url".localized
        case .noImages:
            "no_images".localized
        }
    }
}
