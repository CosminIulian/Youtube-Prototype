//
//  DateManager.swift
//  Youtube Prototype
//
//  Created by Cosmin Iulian on 19/07/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation


class DateManager {
    
    static func getDateFormat(_ date: Date) -> String {
        
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        
        return df.string(from: date)
    }
}
