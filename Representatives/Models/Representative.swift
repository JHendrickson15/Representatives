//
//  Representative.swift
//  Representatives
//
//  Created by Jordan Hendrickson on 5/16/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import Foundation


struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
