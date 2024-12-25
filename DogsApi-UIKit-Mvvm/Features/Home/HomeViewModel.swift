//
//  HomeViewModel.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 18.12.2024.
//

import Foundation

class HomeViewModel {
    @Published var dogs: [Dog] = []
    private let dogsService: DogsServiceProtocol
    
    init(dogsService: DogsServiceProtocol = DogsService()) {
        self.dogsService = dogsService
    }
    
    func fetchDogs() async throws {
        let fetchedDogs = try await dogsService.fetchDogs()
        DispatchQueue.main.async {
            self.dogs = fetchedDogs
        }
    }
}
