//
//  bloodTypeSheet.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct bloodTypeSheet: View {
    @Binding var bloodType: String
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            Picker(selection: $bloodType, label: Text("血液型")) {
                Text("A型").tag("A型")
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
                
                Text("B型").tag("B型")
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
                
                Text("AB型").tag("AB型")
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
                
                Text("O型").tag("O型")
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
                
            }
            .pickerStyle(WheelPickerStyle())
            .navigationBarItems(
                trailing: Button("OK") {
                    dismiss()
                }
                    .font(.custom("RoundedMplus1c-Medium", size: 18))
            )
        }
    }
}

struct bloodTypeSheet_Previews: PreviewProvider {
    @State static var bloodType: String = "A型"
    static var previews: some View {
        bloodTypeSheet(bloodType: $bloodType)
    }
}
