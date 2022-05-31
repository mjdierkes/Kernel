//
//  Show.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/17/22.
//

import Foundation

struct Result: Codable {
    var results: [Show]
}

struct Show: Codable, Identifiable {
//    let backdrop_path: String
    let first_air_date: String
    let id: Int
    let name: String
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
    
    func getURL() -> URL {
        if let url = MovieService.getImageURL(for: .originalImage, with: poster_path) {
            return url
        }
        print("FAIL")
        return URL(string: "example.com")!
    }
}
