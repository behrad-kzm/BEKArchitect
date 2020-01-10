//
//  DirectoryManager.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation
struct DirectoryManager {
    
    func getProjectName() throws -> String  {
        let projectFolders = Folder.current.subfolders.filter{$0.url.pathExtension == CommonFileTypes.xcodeProject.rawValue}
        if projectFolders.count == 1, let projectFolder = projectFolders.first {
            return projectFolder.nameExcludingExtension
        }
        let errorType = Errors.notFounds.xcodeProject
        let error = NSError(domain: errorType.getDescription(), code: errorType.getCode(), userInfo: nil)
        throw error
    }
}
