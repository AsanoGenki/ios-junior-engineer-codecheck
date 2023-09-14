//
//  InputView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var dataController = DataController()
    @State private var editting = false
    @State var isShowingBirthdaySheet = false
    @State var isShowingBloodTypeSheet = false
    @State var isShowingResultView = false
    
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
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .padding(.top, 50)
                VStack(alignment: .leading) {
                    Text("名前")
                        .font(.title3)
                    TextField("山田太郎",
                              text: $dataController.userName,
                              onEditingChanged: { begin in
                        if begin {
                            self.editting = true
                        } else {
                            self.editting = false
                        }
                        
                    })
                    .focused(self.$focus)
                    .padding(.all)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                editting && !isShowingBirthdaySheet && !isShowingBloodTypeSheet ? Color.green : Color(UIColor.separator),
                                lineWidth: 2
                            )
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("誕生日")
                        .font(.title3)
                    Text(dateToString(dateString: dataController.birthDay)!)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    isShowingBirthdaySheet ? Color.green : Color(UIColor.separator),
                                    lineWidth: 2
                                )
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            self.focus = false
                            self.isShowingBirthdaySheet.toggle()
                        }
                }
                
                VStack(alignment: .leading) {
                    Text("血液型")
                        .font(.title3)
                    Text(dataController.bloodType)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    isShowingBloodTypeSheet ? Color.green : Color(UIColor.separator),
                                    lineWidth: 2
                                )
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            self.focus = false
                            self.isShowingBloodTypeSheet.toggle()
                        }
                    
                }
                Button {
                    if dataController.bloodType == "AB型" {
                        dataController.bloodTypeReplace = "ab"
                    } else {
                        dataController.bloodTypeReplace = dataController.bloodType.first!.description.lowercased()
                    }
                    
                    Task {
                        await dataController.readFortune()
                    }
                    
                    isShowingResultView.toggle()
                } label: {
                    ButtonView(text: "占う", color: .blue)
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
                ResultView(todofuken: $dataController.result.name, capital: $dataController.result.capital, citizanDay: $dataController.result.citizen_day, hasCoastLine: $dataController.result.has_coast_line, logoURL: $dataController.result.logo_url, brief: $dataController.result.brief)
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
