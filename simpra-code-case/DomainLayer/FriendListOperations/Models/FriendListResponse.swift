//
//  FriendListResponse.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

struct FriendListResponse: Codable {
    let results: [Friend]
}

struct Friend: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let phone: String
    let picture: Picture
    let nat: String
}

struct Location: Codable {
    let street: Street
    let city, state, country: String
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}

struct Name: Codable {
    let first, last: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
