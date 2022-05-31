//
//  Movie.swift
//  Kernel
//
//  Created by Mason Dierkes on 5/15/22.
//

import Foundation


struct Request: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    func getURL() -> URL {
        if let url = MovieService.getImageURL(for: .originalImage, with: poster_path) {
            return url
        }
        print("FAIL")
        return URL(string: "")!
    }
}

