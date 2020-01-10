//
//  Engine.swift
//  BEKArchitect
//
//  Created by Behrad Kazemi on 1/9/20.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Foundation


public final class Engine {
    let arguments: [String]
    let directory = DirectoryManager()
    var contents: ContentProvider!
    public init (arguments: [String]) {
        self.arguments = arguments
        
    }
    
    public func execute() throws {
        let projectName: String
        let authorName: String
        let organizationName: String
        
        do {
            projectName = try directory.getProjectName()
            organizationName = "todo"
            authorName = "todo"
        } catch let error {
            throw error
        }
        
        contents = ContentProvider(projectName: projectName , authorName: authorName, organizationName: organizationName)
        let fileName = "test.swift"
        let license = contents.createLicense(forFileName: fileName)
        let data = Data(license.utf8)
        print(Folder.current.subfolders.first?.url.pathExtension)
        try? Folder.current.createFile(at: fileName, contents: data)
        
    }
}
