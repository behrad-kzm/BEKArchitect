//
//  main.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation
do {
    try Engine(arguments: CommandLine.arguments).execute()
}catch let error {
    Logger.printError(error: error as NSError)
}


