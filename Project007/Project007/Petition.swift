//
//  Petition.swift
//  Project007
//
//  Created by Jose Francisco Fornieles on 29/05/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
