//
//  ResultView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var dataController = DataController()
    @ObservedObject var prefectureAPILoader = ExternalPrefectureAPILoader()
    
    @State var isShowingStartView = false
    
    @Binding var isLoading: Bool
    @Binding var todofuken: String
    @Binding var capital: String
    @Binding var citizanDay: Result.MonthDay?
    @Binding var hasCoastLine: Bool
    @Binding var logoURL: URL
    @Binding var brief: String
    
    @State var lastUpdatedInt = 0
    @State var lastUpdatedStr = ""
    
    let del4: Set<Character> = ["県", "府", "都"]
    let del4_kyoto: Set<Character> = ["県", "府"]
    
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
                        
                        Section("基本情報 (2019年)") {
                            Text("人口: \(formatNumber(number:Double((prefectureData(todofuken: todofuken)?.population ?? 0))))")
                            Text("県庁所在地: \(capital)")
                            
                            Text("県民の日: ")
                            + Text(citizanDay != nil ? "\(citizanDay!.month)月\(citizanDay!.day)日" : "なし")
                            
                            Text("海岸線: ")
                            + Text(hasCoastLine ? "あり" : "なし")
                            
                            NavigationLink {
                                WikipediaView(todofuken: $todofuken, brief: $brief)
                                    .navigationBarTitle("Wikipedia", displayMode: .inline)
                            } label: {
                                Text("特徴")
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        
                        Section("COVID-19: (\(lastUpdatedStr))") {
                            
                            Text("感染した人数: \(formatNumber(number:Double((prefectureData(todofuken: todofuken)?.cases ?? 0))))")
                                .onAppear {
                                    lastUpdatedInt = prefectureData(todofuken: todofuken)?.last_updated.cases_date ?? 20220905
                                    
                                    lastUpdatedStr = intToDateString(int: lastUpdatedInt)
                                    
                                }
                            
                            Text("入院した人数: \(formatNumber(number:Double((prefectureData(todofuken: todofuken)?.hospitalize ?? 0))))")
                            
                            Text("死者数: \(formatNumber(number:Double((prefectureData(todofuken: todofuken)?.deaths ?? 0))))")
                            
                            Text("PCR検査した人数: \(formatNumber(number:Double((prefectureData(todofuken: todofuken)?.pcr ?? 0))))")
                            
                            
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
                            ButtonView(text: "ホームに戻る", color: .green, backColor: .yellow)
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
    
    func prefectureData(todofuken: String) -> LocationData? {
        
        if todofuken != "京都府" {
            
            let foundData = prefectureAPILoader.comments.first(where: { $0.name_ja == todofuken.filter { !del4.contains($0) } })
            return foundData
            
        } else {
            
            let foundData = prefectureAPILoader.comments.first(where: { $0.name_ja == todofuken.filter { !del4_kyoto.contains($0) } })
            return foundData
            
        }
    }
    
    func intToDateString(int: Int) -> String {
        let str = String(int)
        
        let year = str.prefix(4)
        let day = str.suffix(2)
        
        let startIndex = str.index(str.startIndex, offsetBy: 4)
        let endIndex = str.index(str.endIndex,offsetBy: -3)
        
        let month = str[startIndex...endIndex]
        
        let lastUpdated = "\(year)年\(month)月\(day)日 時点"
        
        return lastUpdated
    }
    
    //↓ChatGPTで作成
    //プロンプト: SwiftUIで100000を10.0万人と表記するにはどうすれば良いですか
    func formatNumber(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1 // 小数点以下の桁数を1桁に設定
        
        // 数値が10000以上の場合、「万」を付け加える
        if number >= 10000 {
            numberFormatter.positiveSuffix = "万人"
            return numberFormatter.string(from: NSNumber(value: number / 10000.0)) ?? ""
        }
        
        else {
            
            let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) ?? ""
            return formattedNumber + "人"
            
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
