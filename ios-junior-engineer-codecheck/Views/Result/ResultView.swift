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
    
    @Binding var isLoading: Bool
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
                            dataController.textSpeech(todofuken)
                        }
                    }
            }
        } else {
            NavigationStack {
                GeometryReader { geometry in
                    List {
                        VStack(alignment: .leading) {
                            Text("今日あなたと")
                            Text("相性が良い都道府県は...")
                            
                        }.font(.system(size: 28))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 30)
                            .padding(.bottom, 10)
                            .listRowSeparator(.hidden)
                        
                        VStack(alignment: .center) {
                            
                            Text(todofuken)
                                .font(.system(size: 32))
                                .fontWeight(.medium)
                            
                            AsyncImage(url: logoURL, scale: 3) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: geometry.size.width * 0.6)
                            
                        }.frame(maxWidth: .infinity)
                            .listRowSeparator(.hidden)
                        
                        Section("基本情報") {
                            Text("県庁所在地: \(capital)")
                            
                            Text("県民の日: ")
                            + Text(citizanDay != nil ? "\(citizanDay!.month)月\(citizanDay!.day)日" : "なし")
                            
                            Text("海岸線: ")
                            + Text(hasCoastLine ? "あり" : "なし")
                            
                            NavigationLink {
                                WikipediaView(todofuken: $todofuken, brief: $brief)
                                    .navigationBarTitle("Wikipedia", displayMode: .inline)
                            } label: {
                                Text("Wikipedia")
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        
                        
                            Button {
                                dataController.playClickNormal()
                                
                                var transaction = Transaction()
                                transaction.disablesAnimations = true
                                withTransaction(transaction) {
                                    isShowingStartView = true
                                }
                            } label: {
                                ButtonView(text: "ホームに戻る", color: .green)
                            }.listRowSeparator(.hidden)
                            .buttonStyle(PlainButtonStyle())
                            .frame(maxWidth: .infinity)
                            .padding(.top, 20)
                        
                    }.listStyle(PlainListStyle())
                }
            }
            
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
    @State static var isLoading = false
    
    static var previews: some View {
        ResultView(isLoading: $isLoading, todofuken: $todofuken, capital: $capital, citizanDay: $citizenDay, hasCoastLine: $hasCoastLine, logoURL: $logoURL, brief: $brief)
    }
}
