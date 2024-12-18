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
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
       
        if isLoggedIn{
            pushToPage(Constants.Pages.mainTabBar)
        }else{
            pushToPage(Constants.Pages.login)
        }
  
    }

    func pushToPage(_ page: String) {
        switch page {
        case Constants.Pages.login:
            let loginViewController = LoginViewController()
            navigationController.setViewControllers([loginViewController], animated: true)

        case Constants.Pages.mainTabBar:
            let mainTabBarViewController = MainTabBarController()
            navigationController.setViewControllers([mainTabBarViewController], animated: true)

        default:
            print("Bilinmeyen sayfa: \(page)")
        }
    }
}
