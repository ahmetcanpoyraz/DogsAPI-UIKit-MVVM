//
//  DogeDetailViewModel.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 25.12.2024.
//

import Foundation

class DogDetailViewModel {
    @Published var dog: DogDetailModel?
    private let dogsService: DogsServiceProtocol
    
    init(dogsService: DogsServiceProtocol = DogsService()) {
        self.dogsService = dogsService
    }
    
    func fetchDogDetail(id: String) async throws {
        let fetchedDogDetail = try await dogsService.fetchDogDetail(dogId: id)
        DispatchQueue.main.async {
            self.dog = fetchedDogDetail
        }
    }
}
