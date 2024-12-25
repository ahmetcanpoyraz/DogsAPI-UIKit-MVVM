//
//  BaseViewModel.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 18.12.2024.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var errorMessage: String?

    func handleError(_ error: Error) {
        if let networkError = error as? NetworkError {
            self.errorMessage = networkError.localizedDescription
        } else {
            self.errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
        }
    }
}
