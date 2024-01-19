//
//  CredentialsStorage.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 14.01.2024.
//

import Foundation
import SwiftKeychainWrapper

protocol CredentialsStorageProtocol: AnyObject {
    var isLoggedIn: Bool { get set }
    var firstName: String? { get set }
    var lastName: String? { get set }
    var email: String? { get set }
    func removeCredentials()
}

final class CredentialsStorage: CredentialsStorageProtocol {
    
    static let shared = CredentialsStorage()
    
    private let keychainWrapper = KeychainWrapper.standard
    
    private enum Keys: String {
        case isLoggedIn
        case firstNameKey
        case lastNameKey
        case emailKey
    }
    
    var isLoggedIn: Bool {
        get {
            keychainWrapper.bool(forKey: Keys.isLoggedIn.rawValue) ?? false
        }
        set {
            keychainWrapper.set(newValue, forKey: Keys.isLoggedIn.rawValue)
        }
    }
    
    var firstName: String? {
        get {
            keychainWrapper.string(forKey: Keys.firstNameKey.rawValue)
        }
        set {
            if let newValue {
                keychainWrapper.set(newValue, forKey: Keys.firstNameKey.rawValue)
            } else {
                keychainWrapper.removeObject(forKey: Keys.firstNameKey.rawValue)
            }
        }
    }
    
    var lastName: String? {
        get {
            keychainWrapper.string(forKey: Keys.lastNameKey.rawValue)
        }
        set {
            if let newValue {
                keychainWrapper.set(newValue, forKey: Keys.lastNameKey.rawValue)
            } else {
                keychainWrapper.removeObject(forKey: Keys.lastNameKey.rawValue)
            }
        }
    }
    
    var email: String? {
        get {
            keychainWrapper.string(forKey: Keys.emailKey.rawValue)
        }
        set {
            if let newValue {
                keychainWrapper.set(newValue, forKey: Keys.emailKey.rawValue)
            } else {
                keychainWrapper.removeObject(forKey: Keys.emailKey.rawValue)
            }
        }
    }
    
    private init() {}
    
    func removeCredentials() {
        keychainWrapper.removeObject(forKey: Keys.firstNameKey.rawValue)
        keychainWrapper.removeObject(forKey: Keys.lastNameKey.rawValue)
        keychainWrapper.removeObject(forKey: Keys.emailKey.rawValue)
    }
}
