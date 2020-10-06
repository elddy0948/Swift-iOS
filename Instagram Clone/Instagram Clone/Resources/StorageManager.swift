//
//  StorageManager.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import FirebaseStorage
import Foundation

public class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
     
    //MARK: - Public
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    public func downloadImage(with reference: String, completion: @escaping  (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL { (url, error) in
            guard let url = url,
                  error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
}

public enum UserPostType {
    case photo
    case video
}

/// Represent a user Post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL    //either Video url or resolution photo
    let caption: String?
    let likeCount: [PostLikes]
    let comment: [PostComment]
    let createdDate: Date
}

struct PostLikes {
    let userName: String
    let postIdentifier: String
}

struct CommentLike {
    let userName: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLike]
}
