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

    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            "".localized
        case .failedToDecodeResponse:
            "".localized
        case .invalidUrl:
            "".localized
        }
    }
}
