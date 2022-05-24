//
//  Movie.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 12.05.2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let items: [Title]
}

struct Title: Codable {
    let crew: String?
    let id: String?
    let fullTitle: String?
    let title: String?
    let imDbRating: String?
    let imDbRatingCount:String?
    let yaer: String?
    let rank: String?
    let rankUpDown:String?
    let image: String?
       
}

/*
 {
crew = "Sam Raimi (dir.), Benedict Cumberbatch, Elizabeth Olsen";
fullTitle = "Doctor Strange in the Multiverse of Madness (2022)";
id = tt9419884;
imDbRating = "7.5";
imDbRatingCount = 117127;
image = "https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_UX128_CR0,3,128,176_AL_.jpg";
rank = 1;
rankUpDown = "+5";
title = "Doctor Strange in the Multiverse of Madness";
year = 2022;
},
 */
