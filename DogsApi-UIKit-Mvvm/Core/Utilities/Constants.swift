//
//  Constants.swift
//  DogsApi-MVVM-UIKit
//
//  Created by İzmir İnovasyon ve Teknoloji on 16.12.2024.
//

import Foundation

struct Constants {
    struct Endpoints {
        static let baseUrl = "https://api.thecatapi.com/v1/"
        static let dogs = "breeds?limit=10&page=0"
        static let dogDetail = "breeds/"
    }
    struct Pages {
        static let login = "Login"
        static let mainTabBar = "MainTabBar"
    }
}
