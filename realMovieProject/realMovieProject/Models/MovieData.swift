//
//  MovieData.swift
//  realMovieProject
//
//  Created by 박진성 on 2023/05/28.
//

import UIKit

struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let movieNm, openDt: String
}


