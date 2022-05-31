//
//  Section.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import SwiftUI

struct Section: View {
    
    let title: String
    @Binding var movies: [Movie]
    @EnvironmentObject var manager: AppManager
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MoviePage(movie: movie)        .environmentObject(manager)) {
                            AsyncImage(
                                url: movie.getURL(),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 150)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .cornerRadius(8)
                        }
                    }
                    
                }
            }
        }
    }
}
