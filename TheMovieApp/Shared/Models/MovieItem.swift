//
//  MovieItem.swift
//  TheMovieApp
//
//  Created by Ivan Simunovic on 19.10.2021..
//

import Foundation

struct MovieItem {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    var isFavourite: Bool
    var isWatched: Bool
}
