//
//  MoviesListRepository.swift
//  TheMovieApp
//
//  Created by Ivan Simunovic on 18.10.2021..
//

import Foundation

class MoviesListRepository {
    func getMoviesList(completion: @escaping (Result<Movies, NetworkError>) -> ()){
        RestManager.fetch(url: "https://api.themoviedb.org/3/movie/now_playing?api_key=aaf38b3909a4f117db3fb67e13ac6ef7&language=en-US&page=1", completionHandler: completion)
    }
}
