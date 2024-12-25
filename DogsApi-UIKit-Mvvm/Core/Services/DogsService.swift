//
//  DogsService.swift
//  DogsApi-MVVM-UIKit
//
//  Created by İzmir İnovasyon ve Teknoloji on 16.12.2024.
//

import Foundation


protocol DogsServiceProtocol {
    func fetchDogs() async throws -> [Dog]
    func fetchDogDetail(dogId : String) async throws -> DogDetailModel
}

class DogsService: DogsServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func fetchDogs() async throws -> [Dog] {
        try await networkService.request(Constants.Endpoints.dogs, method: "GET", body: nil)
    }
    
    func fetchDogDetail(dogId : String) async throws -> DogDetailModel {
        try await networkService.request(Constants.Endpoints.dogDetail + dogId, method: "GET", body: nil)
    }
    
}
