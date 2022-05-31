//
//  CollectionsView.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct CollectionsView: View {
    
    @EnvironmentObject var manager: AppManager
    @Binding var collectionName: String

    var collections: [Collection]
    
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100))
        ]
        
        LazyVGrid(columns: columns, spacing: 30) {
            NewCollection()
                .onTapGesture {
                    if let movie = manager.currentMovie {
                        var movies = [Movie]()
                        movies.append(movie)
                        let collection = Collection(name: collectionName, movies: movies)
                        manager.addCollection(collection: collection)
                    }
                }
            ForEach(collections) { collection in
                CollectionItem(collection: collection)
            }
        }
        .padding()
        Spacer()
    }
}

//struct CollectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionsView()
//    }
//}
