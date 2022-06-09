//
//  APICaller.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 12.05.2022.
//

import Foundation


struct Constants {
    static let API_KEY = "k_8r02s7xa"
    static let baseURL = "https://imdb-api.com"
    static let YoutubeAPI_KEY = "AIzaSyA57SAJuw2VYd7LRsZWv3hChszD8si_WUA"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
   static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result <[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/MostPopularMovies/\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.items))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTrandingTvs(completion: @escaping (Result <[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/MostPopularTVs/\(Constants.API_KEY)") else { return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.items))
                    
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        task.resume()
    }
    
//https://imdb-api.com/en/API/Top250Movies/k_8r02s7xa
    
    func getTop250Movies(completion: @escaping (Result <[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/Top250Movies/\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.items))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
//https://imdb-api.com/en/API/Top250TVs/k_8r02s7xa
    
    func getTop250TVs(completion: @escaping (Result <[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/Top250TVs/\(Constants.API_KEY)") else { return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.items))
                    
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        task.resume()
    }
    
//https://imdb-api.com/en/API/SearchMovie/k_8r02s7xa/inception%202010
    
    func getDiscoverMovies(completion: @escaping (Result <[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/en/API/MostPopularMovies/\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.items))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func search(with query: String,completion: @escaping (Result <[Search], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/en/API/SearchTitle/\(Constants.API_KEY)/\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
//https://youtube.googleapis.com/youtube/v3/search?q=harry&key=[YOUR_API_KEY]
    
    func getMovie(with query: String,completion: @escaping (Result <VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()

    }
    
}
