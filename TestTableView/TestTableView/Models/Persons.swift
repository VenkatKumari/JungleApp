//
//  Persons.swift
//  TestTableView
//
//  Created by Venkat Kumari Natarajan on 11/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import Foundation

struct Person: Codable {
    let results: [PersonDetail]
}

struct PersonDetail: Codable{
    let gender: String
    let name: Name
    let email: String
    let phone: String
    let cell: String
    let picture: Picture
    let location: Location
    
    
}


struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
    let thumbnail: String
}

struct Location: Codable {
    let street: String
    let city: String
}

