//
//  YoutubeSearchResponse.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 08.06.2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
