//
//  CollectionsPage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct CollectionsPage: View {
    
    @EnvironmentObject var manager: AppManager
    @State private var collectionName = "My Collections"

    var body: some View {
        
        ScrollView {
            TextField("Collection Name", text: $collectionName)
            CollectionsView(collectionName: $collectionName, collections: manager.profile.collections)
        }
        .environmentObject(manager)
       
    }
}

struct CollectionsPage_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsPage()
    }
}
