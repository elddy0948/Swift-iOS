//
//  AuthManager.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import FirebaseAuth


public class AuthManager {
    static let shared = AuthManager()
    
    //MARK: -Public
    public func registerNewUser(userName: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
          - check if username is available
          - check if email is available
          - create account
          - insert account to database
        */
        
        DatabaseManager.shared.createNewUser(with: email, username: userName, password: password) { (canCreate) in
            if canCreate {
//                - create account
//                - insert account to database
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // Friebase auth could not create account
                        completion(false)
                        return
                    }
//                    - insert account to database
                    DatabaseManager.shared.insertNewUser(with: email, username: userName) { (success) in
                        if success {
                            completion(true)
                            return
                        } else {
                            //Failed to insert user in database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // either username or email not exist
                completion(false)
            }
        }
        
        
        
    }
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email login
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username login
            print(username)
        }
    }
    
    /// Attemp to logout firebase user
    public func logout(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }
}
