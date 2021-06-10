//
//  SecurityService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 09.06.2021.
//

import Foundation
import LocalAuthentication
import Security

private enum KeyChainConstants {
    static let protectionState: String = "keychainProtectionState"
    static let token: String = "keychainToken"
}

public final class SecurityService: SecurityServiceProtocol {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func saveProtectionState(_ state: ProtectionState) {
        _ = createEntry(key: KeyChainConstants.protectionState, data: state.rawValue.data(using: .utf8) ?? Data())
    }
    
    public func getProtectionState() -> ProtectionState {
        if let data = getEntry(key: KeyChainConstants.protectionState),
           let stringState = String(data: data, encoding: .utf8),
           let state = ProtectionState(rawValue: stringState) {
            return state
        }
        return .none
    }
    
    public func saveRefreshToken(_ token: String, with password: String) {
        _ = createEntry(key: KeyChainConstants.token, data: token.data(using: .utf8) ?? Data(), password: password)
    }
    
    public func getRefreshToken(with password: String) -> String {
        let context = LAContext()
        context.setCredential(Data(password.utf8), type: .applicationPassword)
        if let data = getPassProtectedEntry(key: KeyChainConstants.token, context: context) {
            
            if let stringToken = String(data: data, encoding: .utf8) {
                
                return stringToken
                
            }
        }
        
        return ""
    }

    // MARK: - Private methods

    private func createEntry(key: String, data: Data) -> OSStatus {
        let query =
            [
                kSecClass as String: kSecClassGenericPassword as String,
                kSecAttrAccount as String: key,
                kSecValueData as String: data as NSData
            ] as CFDictionary
        
        SecItemDelete(query)
        return SecItemAdd(query, nil)
    }
    
    private func createEntry(key: String, data: Data, password: String) -> OSStatus {
        let context = LAContext()
        context.setCredential(password.data(using: .utf8), type: .applicationPassword)
        
        let query =
            [
                kSecClass as String: kSecClassGenericPassword as String,
                kSecAttrAccount as String: key,
                kSecAttrAccessControl as String: getPasswordAccessControl(),
                kSecValueData as String: data as NSData,
                kSecUseAuthenticationContext: context
            ] as CFDictionary
        
        SecItemDelete(query)
        return SecItemAdd(query, nil)
    }
    
    private func getEntry(key: String) -> Data? {
        let query =
            [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecReturnData as String: kCFBooleanTrue ?? false,
                kSecMatchLimit as String: kSecMatchLimitOne
            ] as CFDictionary
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        if status == noErr {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }
    
    private func getPassProtectedEntry(key: String, context: LAContext? = nil) -> Data? {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue ?? false,
            kSecAttrAccessControl as String: getPasswordAccessControl(),
            kSecMatchLimit as String: kSecMatchLimitOne]
        
        if let context = context {
            query[kSecUseAuthenticationContext as String] = context
            query[kSecUseAuthenticationUI as String] = kSecUseAuthenticationUI
        }
        
        var dataTypeRef: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }
    
    private func getPasswordAccessControl() -> SecAccessControl {
        var access: SecAccessControl?
        var error: Unmanaged<CFError>?
        
        access = SecAccessControlCreateWithFlags(nil,
                                                 kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
                                                 .applicationPassword,
                                                 &error)
        precondition(access != nil, "SecAccessControlCreateWithFlags failed")
        return access!
    }
}
