//
//  APIClient.swift
//  DogsApi-MVVM-UIKit
//
//  Created by İzmir İnovasyon ve Teknoloji on 16.12.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String, method: String, body: Data?) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    private let apiKey = "live_eZp3RE5Avm3ywWroxAyBUjAxVYrQCT93Vagy3bdDvIM5nfss19sGfxSSIBEe7yqA"
    
    private init() {}
    
    func request<T: Decodable>(
        _ endpoint: String,
        method: String,
        body: Data?
    ) async throws -> T {
        guard let url = URL(string: Constants.Endpoints.baseUrl + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.httpBody = body
            request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.requestFailed
            }
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                
                return decodedData
            } catch {
                print("Decoding error: \(error)") 
                throw NetworkError.decodingFailed
            }
        } catch {
            print("Network error occurred: \(error.localizedDescription)") // Hata mesajını burada yazdırıyoruz
            throw NetworkError.unknown
        }
    }
}

