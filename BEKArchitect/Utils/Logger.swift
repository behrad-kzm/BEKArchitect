//
//  Logger.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/10/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation
struct Logger {
    static func printError(error: NSError){
        print("\u{001B}[0;31m[!] \(error.domain)")
    }
}
