//
//  DataController.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI
import RealmSwift
import AVFoundation

class DataController: ObservableObject {
    
    @Published var userName = ""
    @Published var birthDay = Date()
    @Published var bloodType = "A型"
    @Published var bloodTypeReplace = "a"
    @Published var result: Result = Result()

    @AppStorage("soundEffect") var isPlayingSE = true
    @AppStorage("voice") var isPlayingVoice = true
    
    let calendar = Calendar(identifier: .gregorian)
    let now = Date()
    
    
    //音声ファイル再生の処理
    private let clickSound = try!  AVAudioPlayer(data: NSDataAsset(name: "SE_click_normal")!.data)
    private let clickSound2 = try! AVAudioPlayer(data: NSDataAsset(name: "SE_click_small")!.data)
    
    let synthesizer = AVSpeechSynthesizer()
    
    func playClickNormal(){
        if isPlayingSE {
            clickSound.volume = 0.7
            clickSound.play()
        } else {
            return
        }
    }
    
    func playClickSmall() {
        if isPlayingSE {
            clickSound2.volume = 0.7
            clickSound2.play()
        } else {
            return
        }
    }
    
    func textSpeech(_ text: String) {

        if isPlayingVoice {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            utterance.rate = 0.45
            utterance.volume = 1
            utterance.pitchMultiplier = 1.1
            self.synthesizer.speak(utterance)
        } else {
            return
        }
        
    }
    
    
    //占い結果を取得するAPIの処理
    func readFortune() async {
        
        guard let url = URL(string: "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud/my_fortune") else {
            print("error")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("v1", forHTTPHeaderField: "API-Version")

        request.httpMethod = "POST"
        
        let users: [String: Any] = [
            "name": userName,
            "birthday": [
                "year": Int(calendar.component(.year, from: birthDay)),
                "month": Int(calendar.component(.month, from: birthDay)),
                "day": Int(calendar.component(.day, from: birthDay))
            ],
            "blood_type": bloodTypeReplace,
            "today": [
                "year": Int(calendar.component(.year, from: now)),
                "month": Int(calendar.component(.month, from: now)),
                "day": Int(calendar.component(.day, from: now))
            ]
        ]
        
        //受け取ったデータの入力(ユーザーネーム、誕生日、血液型等)
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
                
                DispatchQueue.main.async {
                    //結果データの出力
                    self.result = responseObject
                }
                
                //Realmに結果データを保存
                self.addRealmItem(userName: self.userName, birthday: self.birthDay, bloodType: self.bloodType, todofuken: responseObject.name, logoURL: responseObject.logo_url.absoluteString, createDate: self.now)
                
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
    
    //Realmデータの処理
    @Published var model: RealmModel = RealmModel()
    var realmItems: Results<RealmItem> {
        model.items
    }
    
    func addRealmItem(userName: String, birthday: Date, bloodType: String, todofuken: String, logoURL: String, createDate: Date) {
        
        model.addRealmItem(userName: userName, birthday: birthday, bloodType: bloodType, todofuken: todofuken, logoURL: logoURL, createDate: createDate)
    }
    
}
