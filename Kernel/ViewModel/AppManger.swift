//
//  AppManger.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/15/22.
//

import Foundation

@MainActor class AppManager: ObservableObject {
    
    @Published var popular = Request(results: [Movie]())
    @Published var upcoming = Request(results: [Movie]())
    @Published var result = Result(results: [Show]())
    @Published var profile = Profile(name: "Mason")
    @Published var currentMovie: Movie?
    
    init() {
        Task {
            let movieService = MovieService()
            do {
                popular = try await movieService.fetchData(from: .popular)
                upcoming = try await movieService.fetchData(from: .upcoming)
                result = try await movieService.fetchData(from: .tvPopular)
            } catch {
                print("Ouch")
            }
        }
    }
    
    public func addCollection(collection: Collection) {
        profile.collections.append(collection)
    }

    
    
}

