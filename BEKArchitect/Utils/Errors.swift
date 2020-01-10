//
//  Errors.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation
enum Errors {
    enum notFounds {
        case xcodeProject
    }
}

extension Errors.notFounds {
    func getDescription() -> String {
        switch self {
        case .xcodeProject:
            return "No Xcode project found, please specify one"
        default:
            return "An error has been occurred!"
        }
    }
    
    func getCode() -> Int {
        switch self {
        case .xcodeProject:
            return 1001
        default:
            return 1000
        }
    }
}
