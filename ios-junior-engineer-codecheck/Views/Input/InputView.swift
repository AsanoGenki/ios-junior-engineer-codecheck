//
//  InputView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI
import Combine

struct InputView: View {
    @ObservedObject var dataController = DataController()
    @State private var editting = false
    @State var isShowingBirthdaySheet = false
    @State var isShowingBloodTypeSheet = false
    @State var isShowingResultView = false
    @State var isLoading = true

    @FocusState var focus:Bool
    
    var buttonEnable: Bool {
        if !dataController.userName.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading, spacing: 28) {
                Text("あなたについて教えてください")
                    .font(.custom("RoundedMplus1c-Bold", size: 23))
                    .fontWeight(.medium)
                    .padding(.top, 50)
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("名前")
                        
                        Spacer()
                        
                        Text("\(dataController.userName.count) / 30")
                    }
                    .font(.custom("RoundedMplus1c-Bold", size: 20))
                    
                    TextField("山田太郎",
                              text: $dataController.userName,
                              onEditingChanged: { begin in
                        if begin {
                            self.editting = true
                        } else {
                            self.editting = false
                        }
                        
                    })
                    .onReceive(Just(dataController.userName)) { _ in
                        //最大文字数を超えたら、最大文字数までの文字列を代入する
                        if dataController.userName.count > 30 {
                            dataController.userName = String(dataController.userName.prefix(30))
                        }
                    }
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
                    
                    .focused(self.$focus)
                    .padding(.all)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                editting && !isShowingBirthdaySheet && !isShowingBloodTypeSheet ? Color.green : Color(UIColor.separator),
                                lineWidth: 3
                            )
                    }
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("誕生日")
                        .font(.custom("RoundedMplus1c-Bold", size: 20))
                    
                    Text(dateToString(dateString: dataController.birthDay)!)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    isShowingBirthdaySheet ? Color.green : Color(UIColor.separator),
                                    lineWidth: 3
                                )
                        }
                        .font(.custom("RoundedMplus1c-Medium", size: 18))
                    
                        .contentShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            self.focus = false
                            self.isShowingBirthdaySheet.toggle()
                        }
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("血液型")
                        .font(.custom("RoundedMplus1c-Bold", size: 20))
                    
                    Text(dataController.bloodType)
                        .font(.custom("RoundedMplus1c-Medium", size: 18))
                    
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    isShowingBloodTypeSheet ? Color.green : Color(UIColor.separator),
                                    lineWidth: 3
                                )
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            self.focus = false
                            self.isShowingBloodTypeSheet.toggle()
                        }
                    
                }
                
                Button {
                    dataController.playClickNormal()
                    if dataController.bloodType == "AB型" {
                        dataController.bloodTypeReplace = "ab"
                    } else {
                        dataController.bloodTypeReplace = dataController.bloodType.first!.description.lowercased()
                    }
                    
                    Task {
                        await dataController.readFortune()
                    }
                    
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        isShowingResultView = true
                    }
                    
                } label: {
                    ButtonView(text: "占う", color: .green, backColor: Color("costomYellow"))
                        .saturation(buttonEnable ? 1 : 0)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .disabled(!buttonEnable)
                
                Spacer()
            }
            .sheet(isPresented: $isShowingBirthdaySheet) {
                birthdaySheet(birthDay: $dataController.birthDay)
                    .presentationDetents([ .fraction(0.35)])
            }
            
            .sheet(isPresented: $isShowingBloodTypeSheet) {
                bloodTypeSheet(bloodType: $dataController.bloodType)
                    .presentationDetents([ .fraction(0.35)])
            }
            
            .fullScreenCover(isPresented: $isShowingResultView) {
                ResultView(isLoading: $isLoading, todofuken: $dataController.result.name, capital: $dataController.result.capital, citizanDay: $dataController.result.citizen_day, hasCoastLine: $dataController.result.has_coast_line, logoURL: $dataController.result.logo_url, brief: $dataController.result.brief)
            }
            
            .padding(.leading)
            .padding(.trailing)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    func dateToString(dateString: Date) -> String? {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: dateString)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
