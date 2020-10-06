//
//  Models.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/07.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birth: Int
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let follower: Int
    let following: Int
    let posts: Int
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
    let taggedUsers: [String]
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
