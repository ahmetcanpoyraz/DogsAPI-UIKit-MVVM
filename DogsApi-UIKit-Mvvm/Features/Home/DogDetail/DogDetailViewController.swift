import Foundation
import UIKit
import Combine

class DogDetailViewController: UIViewController {
    private let dog: Dog
    private let viewModel = DogDetailViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let dogNameLabel = UILabel()
    private let dogDescription = UILabel()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    init(dog: Dog) {
        self.dog = dog
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        fetchDogDetail()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = dog.name
        
        // Dog Name Label
        dogNameLabel.text = "Loading..."
        dogNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Dog Description Label
        dogDescription.translatesAutoresizingMaskIntoConstraints = false
        dogDescription.numberOfLines = 0  // Çok satırlı destek
        dogDescription.textAlignment = .center
        dogDescription.textColor = .darkGray
        
        // Activity Indicator
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        // Add Subviews
        view.addSubview(dogNameLabel)
        view.addSubview(activityIndicator)
        view.addSubview(dogDescription)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Dog Name Label
            dogNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dogNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            // Activity Indicator
            activityIndicator.topAnchor.constraint(equalTo: dogNameLabel.bottomAnchor, constant: 16),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Dog Description Label
            dogDescription.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 16),
            dogDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dogDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    
    private func bindViewModel() {
        viewModel.$dog
            .sink { [weak self] dogDetail in
                guard let self = self, let dogDetail = dogDetail else { return }
                self.updateUI(with: dogDetail)
            }
            .store(in: &cancellables)
    }
    
    private func fetchDogDetail() {
        Task {
            do {
                try await viewModel.fetchDogDetail(id: dog.id)
            } catch {
                showErrorAlert(error.localizedDescription)
            }
        }
    }
    
    private func updateUI(with dogDetail: DogDetailModel) {
        dogNameLabel.text = "Dog Name: \(dogDetail.name)"
        dogDescription.text = "Detail: \(dogDetail.description)"
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    private func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
