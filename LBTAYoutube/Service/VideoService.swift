//
//  VideoStore.swift
//  LBTAYoutube
//
//  Created by Rob on 6/10/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case badURL
  case networkError
  case dataError
  case jsonDecodingError(String)
}
class VideoService {
  enum FeedType: String{
    case home = "home.json"
    case trending = "trending.json"
    case subscriptions = "subscriptions.json"
    case account = "account"
  }

  private let url = "http://localhost:8080/"

  static let shared = VideoService()
  
  func load(for type: FeedType, completionHandler: @escaping (Result<[Video], NetworkError>) -> Void) {
    guard let url = URL(string: "\(url)\(type.rawValue)") else {
      completionHandler(.failure(.badURL))
      return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        completionHandler(.failure(.networkError))
        return
      }
      
      guard let data = data else {
        completionHandler(.failure(.dataError))
        return
      }
      
      do{
        let videos = try JSONDecoder().decode([Video].self, from: data)
        completionHandler(.success(videos))
      }catch{
        completionHandler(.failure(.jsonDecodingError(error.localizedDescription)))
      }
      }.resume()
  }
}
