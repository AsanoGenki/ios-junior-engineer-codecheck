//
//  LoadingView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/14/23.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    var body: some View {
        ZStack {
            ZStack {
                LottieView()
                    .frame(width: 200, height: 200)
                Text("探索中...")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .padding(.top, 120)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct LottieView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = LottieAnimationView(name: "car")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // 親ビューを用意し、LottieAnimationViewをサブビューにする.
        let parentView = UIView()
        parentView.addSubview(view)
        parentView.addConstraints([
            view.widthAnchor.constraint(equalTo: parentView.widthAnchor),
            view.heightAnchor.constraint(equalTo: parentView.heightAnchor)
        ])
        return parentView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // LottieAnimationViewを取得.
        guard let view = uiView.subviews.compactMap({ $0 as? LottieAnimationView }).first else { return }
        
        view.play()
        view.loopMode = .loop
    }
}
