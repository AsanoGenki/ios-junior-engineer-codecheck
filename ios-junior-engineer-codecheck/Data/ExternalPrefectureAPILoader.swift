//
//  ExternalPrefectureAPILoader.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/16/23.
//

import Foundation

//COVID-19 Japan Web APIの処理
class ExternalPrefectureAPILoader: ObservableObject {
    @Published var comments = [LocationData]()

    init() {
        guard let url = URL(string: "https://covid19-japan-web-api.vercel.app/api/v1/prefectures") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Invalid data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let comments = try decoder.decode([LocationData].self, from: data)
                
                //出力データを受け取る
                DispatchQueue.main.async {
                    self.comments = comments
                }
                
            } catch let error {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
