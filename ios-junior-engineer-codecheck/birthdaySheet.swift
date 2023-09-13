//
//  birthdaySheet.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct birthdaySheet: View {
    @State var birthday = Date()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            DatePicker(
                "",
                selection: $birthday,
                displayedComponents: [.date]
            )
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .datePickerStyle(.wheel)
            .labelsHidden()
            .navigationBarItems(
                trailing: Button("OK") {
                    dismiss()
                }
            )
        }
    }
}

struct birthdaySheet_Previews: PreviewProvider {
    static var previews: some View {
        birthdaySheet()
    }
}
