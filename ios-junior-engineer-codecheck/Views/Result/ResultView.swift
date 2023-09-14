//
//  ResultView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var dataController = DataController()
    
    @State var isShowingStartView = false
    @State private var isLoading = true
    
    @Binding var todofuken: String
    @Binding var capital: String
    @Binding var citizanDay: Result.MonthDay?
    @Binding var hasCoastLine: Bool
    @Binding var logoURL: URL
    @Binding var brief: String
    
    var body: some View {
        if isLoading {
            ZStack {
                Rectangle()
                    .fill(Color.black).opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                LoadingView()
                    .frame(width: 170, height: 170)
                    .background(Color.white.cornerRadius(20))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLoading = false
                        }
                    }
            }
        } else {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 40) {
                        VStack(alignment: .leading) {
                            Text("今日あなたと")
                            Text("相性が良い都道府県は...")
                        }
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                        
                        AsyncImage(url: logoURL, scale: 3) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: geometry.size.width * 0.7)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.gray)
                                .padding(.vertical)
                            
                            Text(todofuken)
                                .font(.system(size: 44))
                            
                            Text("県庁所在地: \(capital)")
                                .fontWeight(.medium)
                            
                            Text("県民の日: ")
                                .fontWeight(.medium)
                            + Text(citizanDay != nil ? "\(citizanDay!.month)月\(citizanDay!.day)日" : "なし")
                                .fontWeight(.medium)
                            
                            Text("海岸線: ")
                                .fontWeight(.medium)
                            + Text(hasCoastLine ? "あり" : "なし")
                                .fontWeight(.medium)
                            
                            Text(brief)
                            
                            if let url = dataController.wikiURL(todofuken: todofuken) {
                                Link("もっと詳しく読む", destination: url)
                            }
                            
                        }
                        Button {
                            var transaction = Transaction()
                            transaction.disablesAnimations = true
                            withTransaction(transaction) {
                                isShowingStartView = true
                            }
                        } label: {
                            ButtonView(text: "ホームに戻る", color: .green)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            .fullScreenCover(isPresented: $isShowingStartView) {
                StartView()
            }
        }
    }
    
}

struct ResultView_Previews: PreviewProvider {
    
    @State static var todofuken = "富山県"
    @State static var capital = "富山市"
    @State static var citizenDay: Result.MonthDay? = Result.MonthDay(month: 5, day: 9)
    @State static var hasCoastLine = true
    @State static var logoURL = URL(string:"https://japan-map.com/wp-content/uploads/toyama.png")!
    @State static var brief = "富山県（とやまけん）は、日本の中部地方に位置する県。県庁所在地は富山市。\n中部地方の日本海側、新潟県を含めた場合の北陸地方のほぼ中央にある。\n※出典: フリー百科事典『ウィキペディア（Wikipedia）』"
    
    static var previews: some View {
        ResultView(todofuken: $todofuken, capital: $capital, citizanDay: $citizenDay, hasCoastLine: $hasCoastLine, logoURL: $logoURL, brief: $brief)
    }
}
