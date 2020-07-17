//
//  Response.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 17/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse items
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
