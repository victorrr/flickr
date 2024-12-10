//
//  NetworkServiceProtocol.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-09.
//

import Foundation

// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(with request: URLRequest) async throws -> T
}
