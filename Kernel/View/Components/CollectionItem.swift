//
//  CollectionItem.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct CollectionItem: View {
    
    var collection: Collection
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            VStack {
                HStack(spacing: 15) {
                    ForEach(collection.movies) { movie in
                        AsyncImage(
                            url: movie.getURL(),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 50)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    .cornerRadius(7)
                }
                
                
                HStack {
                    Text(collection.name)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Spacer()
                }
                
            }
            .padding()
        }
        .frame(width: 150, height: 100)
        .cornerRadius(9)

    }
}
//
//struct CollectionItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionItem()
//    }
//}
