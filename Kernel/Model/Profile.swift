//
//  Profile.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/16/22.
//

import Foundation

struct Profile {
    var name: String
    var collections = [Collection]()
}

struct Collection: Identifiable{
    var name: String
    var movies: [Movie]
    
    let id = UUID()
}
