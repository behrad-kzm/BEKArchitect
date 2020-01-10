//
//  DateUtils.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation

extension Date {
    func toStringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
    func yearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }
}
