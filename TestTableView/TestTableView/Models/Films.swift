//
//  Films.swift
//  TestTableView
//
//  Created by epita on 02/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class Films {
    let title: String
    let releaseYear: String
    let directedBy: String
    let with: [String]
    let description: String
    init(_ title: String, releasedOn releaseYear: String, directedBy: String, with: [String], description: String){
        self.title = title
        self.releaseYear = releaseYear
        self.directedBy = directedBy
        self.with = with
        self.description = description
}
}
