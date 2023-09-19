//
//  RecordView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/15/23.
//

import SwiftUI
import RealmSwift

struct RecordView: View {
    @ObservedObject var dataController = DataController()

    var body: some View {
        NavigationStack {
            List {
                ForEach(dataController.realmItems.freeze().reversed(), id: \.id) { item in
                    HStack {
                        VStack (alignment: .leading, spacing: 5) {
                            Text(item.userName)
                                .font(.custom("RoundedMplus1c-Medium", size: 20))
                                .padding(.bottom, 10)
                            HStack(spacing: 0) {
                                Image(systemName: "birthday.cake")
                                Text(dateToString(dateString: item.birthday)!)
                                    .padding(.trailing, 5)
                                Image(systemName: "drop")
                                Text(item.bloodType)
                                    .padding(.trailing, 5)
                                Image(systemName: "calendar")
                                Text(dateToString(dateString: item.createDate)!.suffix(5))
                            }
                            .font(.custom("RoundedMplus1c-Medium", size: 16))
                        }
                        Spacer()
                        ZStack {
                            AsyncImage(url: URL(string: item.logoURL), scale: 3) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }.frame(height: 90)
                            Text(item.todofuken)
                                .font(.custom("RoundedMplus1c-Medium", size: 12))
                        }
                    }
                }
                .onDelete { index in
                    let theItem = dataController.realmItems.reversed()[index.first!]
                    if let ndx = dataController.realmItems.firstIndex(of: theItem) {
                        let realm = try? Realm()
                        try? realm?.write {
                            realm?.delete(self.dataController.realmItems[ndx])
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .listStyle(.plain)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("履歴")
                        .font(.custom("RoundedMplus1c-Bold", size: 18))
                }
                
            }
        }
    }
    
    //Date型のデータをString型にする
    func dateToString(dateString: Date) -> String? {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: dateString)
        }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
