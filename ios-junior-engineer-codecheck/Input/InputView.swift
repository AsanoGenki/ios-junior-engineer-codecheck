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
    
    var body: some View {
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
                .padding(.all)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            editting ? Color.green : Color(UIColor.separator),
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
                                Color(UIColor.separator),
                                lineWidth: 2
                            )
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        self.isShowingBirthdaySheet.toggle()
                    }
            }
            
            VStack(alignment: .leading) {
                Text("血液型")
                    .font(.title3)
                Text("A型")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                Color(UIColor.separator),
                                lineWidth: 2
                            )
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        self.isShowingBloodTypeSheet.toggle()
                    }
                
            }
            Button("占う") {
                print("占うが押されました")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
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
        
        .padding(.leading)
        .padding(.trailing)
        
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
