//
//  DataController.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

class DataController: ObservableObject {
    
    @Published var userName = ""
    @Published var birthDay = Date()
    @Published var bloodType = "A型"
    @Published var result: Result = Result()
        
    func readFortune() async {
        
        guard let url = URL(string: "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud/my_fortune") else {
            print("error")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let users: [String: Any] = [
            "name": "ゆめみん",
            "birthday": [
                "year": 2000,
                "month": 1,
                "day": 27
            ],
            "blood_type": "ab",
            "today": [
                "year": 2023,
                "month": 5,
                "day": 5
            ]
        ]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: users) else { return }
        
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil
            else {
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(Result.self, from: data)
                
                print(responseObject)
                
            } catch {
                print(error)
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                } else {
                    print("unable to parse response as string")
                }
            }
        }
        task.resume()
    }
}
