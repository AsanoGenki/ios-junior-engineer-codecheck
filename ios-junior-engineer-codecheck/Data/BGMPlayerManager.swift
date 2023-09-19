//
//  BGMPlayerManager.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/16/23.
//

import AVFoundation
import SwiftUI

//一部ChatGPTを使用して作成  プロンプト: アプリ起動時にBGMを流して、設定画面からそのBGMをオンオフできるアプリをSwiftUIで作成
//BGM処理
class BGMPlayerManager: ObservableObject {
    static let shared = BGMPlayerManager()

    private var audioPlayer: AVAudioPlayer?
    
    //BGMのオンオフをAppStorageに保存
    @AppStorage("BGM") var isPlayingBGM: Bool = true {
        didSet {
            if isPlayingBGM {
                playBGM()
            } else {
                stopBGM()
            }
        }
    }

    init() {
        configureAudioPlayer()
    }

    private func configureAudioPlayer() {
        audioPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "BGM_Sweet_Peach")!.data)
        if isPlayingBGM {
            audioPlayer?.volume = 0.07
        } else {
            audioPlayer?.volume = 0
        }
        audioPlayer?.numberOfLoops = -1 // 無限ループ
        audioPlayer?.play()
    }

    //BGM再生
    func playBGM() {
        audioPlayer?.volume = 0.07
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.play()
    }

    //BGM停止
    func stopBGM() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}
