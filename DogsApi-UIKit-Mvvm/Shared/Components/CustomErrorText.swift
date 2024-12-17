//
//  CustomErrorText.swift
//  DogsApi-UIKit-Mvvm
//
//  Created by İzmir İnovasyon ve Teknoloji on 17.12.2024.
//

import UIKit

class CustomErrorText: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = .red
        self.font = UIFont.systemFont(ofSize: 14)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
