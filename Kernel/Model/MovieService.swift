//
//  MovieService.swift
//  Kernel
//
//  Created by Mason Dierkes on 1/15/22.
//

import Foundation
import SwiftUI

/// Provides an easy way to interact with the API.
class MovieService {
    private let store: MovieServiceStore
    private(set) var isFetching = false
    
    public init() {
        store = MovieServiceStore()
    }
    
    static func getImageURL(for root: AvailableImageRoot, with token: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = root.rawValue + "/\(token)"
        return components.url
    }
}

@MainActor extension MovieService {
    /// Returns the decoded value of the type provided.
    /// To implement set your variable to the value that fetch data returns.
    /// Make sure to pass in the correct root or this function will throw an error.
    func fetchData<T>(from root: AvailableRoot) async throws -> T where T: Decodable {
        isFetching = true
        defer { isFetching = false }
        let loadedPackage: T = try await store.load(with: root)
        return loadedPackage
    }
}


/// Holds the credentials of the user to send up to the server.
private actor MovieServiceStore {
    
    private let key  = "28b1d9865c335fb413dbad045f2626d6"
    private var path = ""

    
    private var url: String {
        urlComponents.url!.absoluteString.removingPercentEncoding!
    }
    
    /// Builds a URL to connect to the API sever.
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        return components
    }
    
    /// Attempts to decode the data returned from the server.
    func load<T>(with root: AvailableRoot) async throws -> T where T: Decodable {
        
        self.path = root.rawValue
        path += "?api_key=\(key)"
        
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        print(url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
        else { throw DownloadError.statusNotOK }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error \(error)")
            throw DownloadError.decoderError
        }
    }

    
}

/// All the available roots on the server.
enum AvailableRoot: String {
    case popular = "/3/movie/popular"
    case upcoming = "/3/movie/upcoming"
    case tvPopular = "/3/tv/popular"
}

enum AvailableImageRoot: String {
    case originalImage = "/t/p/original"
}


//  MARK: ERROR Handling
/// The most common errors that the JSON data can throw.
enum DownloadError: Error {
    case statusNotOK
    case decoderError
}

/// Adds a description to the error.
extension DownloadError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .statusNotOK:
            return NSLocalizedString(
                "Invalid Credentials",
                comment: ""
            )
        case .decoderError:
            let format = NSLocalizedString(
                "JSON Parse Error",
                comment: ""
            )
            return String(format: format)
        }
    }
}
