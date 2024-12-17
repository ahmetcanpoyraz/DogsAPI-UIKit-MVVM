import Foundation

enum LoginState {
    case idle
    case success
    case failure(String)
}

class LoginViewModel {
    var stateChanged: ((LoginState) -> Void)?
    
    func login(email: String?, password: String?) {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else {
            stateChanged?(.failure("Lütfen tüm alanları doldurun."))
            return
        }
        
        // Sabit giriş doğrulama
        if email == "Test@test.com" && password == "123456" {
            AppCoordinator.shared.pushToPage("Profile")
            stateChanged?(.success)
        } else {
            stateChanged?(.failure("Geçersiz kullanıcı adı veya şifre."))
        }
    }
}
