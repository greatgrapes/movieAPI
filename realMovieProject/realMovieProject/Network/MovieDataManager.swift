//
//  networking.swift
//  realMovieProject
//
//  Created by 박진성 on 2023/05/28.
//

import UIKit

class MovieDataManager {
    var movieData: MovieData?
//     요청 URL, KEY "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=c2a02790b8d39509bfc127184754f3b4&targetDt=20230527"
    
    
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=c2a02790b8d39509bfc127184754f3b4&targetDt=20230527"
    
    func getData() {
        if let url = URL(string: movieURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("DEBUG:: Error!발생")
                    return
                }
                
                if let JSONdata = data {
                    // 데이터 온것 찍어보기
                    //print(JSONdata)
                    //let dataString = String(data: JSONdata, encoding: .utf8)
                    //print(dataString!)
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                        print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                        print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].openDt)
//                        
                        self.movieData = decodedData
                    }
                    catch{
                        print(error)
                    }
                }
               
               
            }
            task.resume()
        }
    }
    
    
    
    
}
