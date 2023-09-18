//
//  birthdaySheet.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct birthdaySheet: View {
    @Binding var birthDay: Date
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            DatePicker(
                "",
                selection: $birthDay,
                displayedComponents: [.date]
            )
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .datePickerStyle(.wheel)
            .labelsHidden()
            
            .navigationBarItems(
                trailing: Button("OK") {
                    dismiss()
                }
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
            )
        }
    }
}

struct birthdaySheet_Previews: PreviewProvider {
    @State static var birthDay: Date = Date()
    static var previews: some View {
        birthdaySheet(birthDay: $birthDay)
    }
}
