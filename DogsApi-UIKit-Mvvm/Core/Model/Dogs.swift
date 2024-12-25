//
//  DogsModel.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 18.12.2024.
//

import Foundation

// MARK: - Dog
struct Dog: Codable {
    let id: String
    let name: String
}

typealias Dogs = [Dog]
