//
//  ProfileViewModel.swift
//  DogsApi-MVVM-UIKit
//
//  Created by İzmir İnovasyon ve Teknoloji on 16.12.2024.
//

import Foundation


class ProfileViewModel {
    

    func logOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        AppCoordinator.shared.pushToPage(Constants.Pages.login)
    }
    
    
}
