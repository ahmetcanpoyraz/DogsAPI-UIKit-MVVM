//
//  APIError.swift
//  DogsApi-MVVM-UIKit
//
//  Created by İzmir İnovasyon ve Teknoloji on 16.12.2024.
//

import Foundation


enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    case noData
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed:
            return "The request failed. Please try again."
        case .decodingFailed:
            return "Failed to decode the response."
        case .noData:
            return "No data received from the server."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
