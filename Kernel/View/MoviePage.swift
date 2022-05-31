//
//  MoviePage.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/15/22.
//

import SwiftUI

struct MoviePage: View {
    
    @EnvironmentObject var manager: AppManager
    @State private var presented = false
    var movie: Movie
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.down.backward.circle.fill")
                            .resizable()
                            .rotationEffect(Angle(degrees: 180))
                            .frame(width: 25, height: 25)
                    }
                   
                }
                .padding()
                
                VStack {
                    
                    AsyncImage(
                        url: movie.getURL(),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 175)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .cornerRadius(7)
                        

                    Text(movie.title)
                        .font(.title2.bold())
                    Text("28 days")
                        .font(.title3.bold())
                }
               
                
                Text(movie.overview)
                .padding(.horizontal)
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.release_date)
                        Text("\(movie.popularity)")
                    }
                    .font(.subheadline.bold())
                    
                    Spacer()
                }
                .padding(.horizontal)
               
                HStack(spacing: 12) {
                    Button {
                        presented.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.stack.fill")
                            Text("Add")
                        }
                    }                        .cornerRadius(20)
                        .buttonStyle(.borderedProminent)

                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                            Image(systemName: "eyeglasses")
                                .padding(.vertical, 10)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .background(.ultraThinMaterial)
                            .cornerRadius(50)
                    }
                    
                    Spacer()
                }
                .foregroundColor(.black)
                .tint(.white)
                .padding(.horizontal)

                Spacer()
            }
            .foregroundColor(.white)
        }
        .background {
            AsyncImage(
                url: movie.getURL(),
                content: { image in
                    image.resizable()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
                .blur(radius: 50, opaque: true)
        }
        .sheet(isPresented: $presented) {
            CollectionsPage()
                .environmentObject(manager)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            manager.currentMovie = movie
        }
        
    }
}

//struct MoviePage_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePage()
//    }
//}
