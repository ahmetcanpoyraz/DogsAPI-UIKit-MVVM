import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    static let shared = AppCoordinator(navigationController: UINavigationController()) // Singleton

    var navigationController: UINavigationController

    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // İlk sayfa yönlendirmesini yapıyoruz
        pushToPage("Login")
    }

    func pushToPage(_ page: String) {
        switch page {
        case "Login":
            let loginViewController = LoginViewController()
            navigationController.pushViewController(loginViewController, animated: true)

        case "Profile":
            let profileViewController = ProfileViewController()
            navigationController.pushViewController(profileViewController, animated: true)

        default:
            print("Bilinmeyen sayfa: \(page)")
        }
    }
}
