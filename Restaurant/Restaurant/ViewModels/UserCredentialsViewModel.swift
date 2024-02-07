//
//  RegistrationFormViewModel.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 23.01.2024.
//

import Foundation

struct RegistrationValidationError: Error {
    let message: String
}

final class UserCredentialsViewModel: ObservableObject {
    
    @Published var userCredentials: UserCredentials
    @Published var errorMessage: String
    @Published var showRegisterInvalidMessage: Bool
    
    private let credentialsStorage = CredentialsStorage.shared
    
    private var isEditMode: Bool {
        credentialsStorage.isLoggedIn
    }
    
    init() {
        self.userCredentials = UserCredentials(
            firstName: credentialsStorage.firstName ?? "",
            lastName: credentialsStorage.lastName ?? "",
            email: credentialsStorage.email ?? "",
            isLoggedIn: false
        )
        self.errorMessage = ""
        self.showRegisterInvalidMessage = false
    }
}

private extension UserCredentialsViewModel {
    
    func validateCredentials() throws {
        
        guard isValid(name: userCredentials.firstName) else {
            throw RegistrationValidationError(message: "First Names can only contain letters and must have at least 3 characters")
        }
        
        guard isValid(name: userCredentials.lastName) else {
            throw RegistrationValidationError(message: "Last Names can only contain letters and must have at least 3 characters")
        }
        
        guard isValid(email: userCredentials.email) else {
            throw RegistrationValidationError(message: "The e-mail is invalid and cannot be blank")
        }
    }
    
    func isValid(name: String, minLength: Int = 3) -> Bool {
        !name.isEmpty && name.count >= minLength && name.allSatisfy { $0.isLetter }
    }
    
    func isValid(email: String) -> Bool {
        let emailValidationRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
    
    func saveProfileChanges() {
        credentialsStorage.firstName = userCredentials.firstName
        credentialsStorage.lastName = userCredentials.lastName
        credentialsStorage.email = userCredentials.email
    }
    
    func registerNewUser() {
        credentialsStorage.firstName = userCredentials.firstName
        credentialsStorage.lastName = userCredentials.lastName
        credentialsStorage.email = userCredentials.email
        credentialsStorage.isLoggedIn = true
    }
}

extension UserCredentialsViewModel {
    
    func processCredentials() {
        do {
            try validateCredentials()
            isEditMode ? saveProfileChanges() : registerNewUser()
            userCredentials.isLoggedIn = true
        } catch let error as RegistrationValidationError {
            errorMessage = "Found these errors in the form:\n\n \(error.message)"
            showRegisterInvalidMessage.toggle()
        } catch {
            errorMessage = "Unexpected error: \(error.localizedDescription)"
            showRegisterInvalidMessage.toggle()
        }
    }
    
    func saveImage(_ data: Data) {
        userCredentials.image = data
        credentialsStorage.image = data
    }
    
    func hasChanges() -> Bool {
        userCredentials.firstName != credentialsStorage.firstName ||
        userCredentials.lastName != credentialsStorage.lastName ||
        userCredentials.email != credentialsStorage.email
    }
    
    func resetChanges() {
        userCredentials.firstName = credentialsStorage.firstName ?? ""
        userCredentials.lastName = credentialsStorage.lastName ?? ""
        userCredentials.email = credentialsStorage.email ?? ""
    }
    
    func logout() {
        credentialsStorage.isLoggedIn.toggle()
        credentialsStorage.removeCredentials()
    }
}
