//
//  PostModel.swift
//  EngineerAiTest
//
//  Created by Techment bhuvan on 09/12/19.
//  Copyright © 2019 Techment bhuvan. All rights reserved.
//

import Foundation
// MARK: - Create Codable model for reciving the responce
class PostModel: Codable{
    var title : String
    var createdAt : String
    
    fileprivate enum CodingKeys :String, CodingKey{
        case title
        case createdAt = "created_at" // Custome Key
    }
}

struct Hits :Codable{
    var hits:[PostModel]
}
