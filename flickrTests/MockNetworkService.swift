//
//  MockNetworkService.swift
//  flickrTests
//
//  Created by Victor Rendon on 2024-12-09.
//

import Foundation

final class MockNetworkService: NetworkServiceProtocol {
    var mockResult: Any?
    var error: Error?

    func fetch<T: Decodable>(with request: URLRequest) async throws -> T {
        if let error = error {
            throw error
        }

        if let result = mockResult as? T {
            return result
        }

        throw NetworkError.invalidResponse
    }
}
