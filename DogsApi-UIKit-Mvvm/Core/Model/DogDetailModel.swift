//
//  DogDetailModel.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 25.12.2024.
//

import Foundation

// MARK: - DogDetailModel
struct DogDetailModel: Codable {
    let name, id: String
    let description : String


    enum CodingKeys: String, CodingKey {
        case id, name, description
    }
}
