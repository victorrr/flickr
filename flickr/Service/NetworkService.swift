//
//  NetworkService.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(with request: URLRequest) async throws -> T
}

final class NetworkService: NetworkServiceProtocol {

    func fetch<T: Decodable>(with request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard
            let httpResponse = response as? HTTPURLResponse,
            (200..<300).contains(httpResponse.statusCode) else {
            print(response)
            throw NetworkError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.failedToDecodeResponse
        }
    }
}
