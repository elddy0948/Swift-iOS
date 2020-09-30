//
//  DatabaseManager.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

//Firebase Database 를 관리하기 위한 파일
import FirebaseDatabase


public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: - Public
    
    ///Check if username and email is available
    /// - Parameter
    ///     -email: String representing email
    ///     -username: String representing username
    public func createNewUser(with email: String, username: String, password: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    ///Insert new user data to Database
    /// - Parameters
    ///     -email: String representing email
    ///     -username: String representing username
    ///     -completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { (error, snapShot) in
            if error == nil {
                // Success
                completion(true)
                return
            } else {
                // Failed
                completion(false)
                return
            }
        }
    }
}
