//
//  ContentProvider.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation
struct ContentProvider {
    private let licenseTemplate = """
//
//  %@
//  %@
//
//  Created by %@ on %@.
//  Copyright © %@ %@. All rights reserved.
//  CI by BEKArchitect.
//
"""
    let projectName: String
    let authorName: String
    let organizationName: String
    
    func createLicense(forFileName fileName: String) -> String {
        let result = String(format: licenseTemplate, fileName, projectName, authorName, Date().toStringDate(), Date().yearString(), organizationName)
        return result
    }
}
