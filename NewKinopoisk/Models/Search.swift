//
//  Search.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 24.05.2022.
//

import Foundation

struct SearchResponse: Codable {
    let results: [Search]
}

struct Search: Codable {
    let id: String?
    let resultType: String?
    let title: String?
    let image: String?
    let description: String?
       
}


//{
//  "searchType": "All",
//  "expression": "lost",
//  "results": [
//    {
//      "id": "tt0411008",
//      "resultType": "Title",
//      "image": "https://imdb-api.com/images/original/MV5BNzhlY2E5NDUtYjJjYy00ODg3LWFkZWQtYTVmMzU4ZWZmOWJkXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_Ratio0.7273_AL_.jpg",
//      "title": "Lost",
//      "description": "(2004) (TV Series)"
//    },
