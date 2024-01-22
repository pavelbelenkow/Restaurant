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

final class RegistrationFormViewModel: ObservableObject {
    @Published var userCredentials = UserCredentials(firstName: "", lastName: "", email: "", isLoggedIn: false)
    @Published var errorMessage = ""
    @Published var showRegisterInvalidMessage = false
    
    private let credentialsStorage = CredentialsStorage.shared
    
    func validateRegister() {
        do {
            try validateCredentials()
            updateCredentials()
            userCredentials.isLoggedIn.toggle()
        } catch let error as RegistrationValidationError {
            errorMessage = "Found these errors in the form:\n\n \(error.message)"
            showRegisterInvalidMessage.toggle()
        } catch {
            errorMessage = "Unexpected error: \(error.localizedDescription)"
            showRegisterInvalidMessage.toggle()
        }
    }
    
    private func validateCredentials() throws {
        
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
    
    private func updateCredentials() {
        credentialsStorage.firstName = userCredentials.firstName
        credentialsStorage.lastName = userCredentials.lastName
        credentialsStorage.email = userCredentials.email
        credentialsStorage.isLoggedIn.toggle()
    }
    
    private func isValid(name: String, minLength: Int = 3) -> Bool {
        !name.isEmpty && name.count >= minLength && name.allSatisfy { $0.isLetter }
    }
    
    private func isValid(email: String) -> Bool {
        let emailValidationRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}
