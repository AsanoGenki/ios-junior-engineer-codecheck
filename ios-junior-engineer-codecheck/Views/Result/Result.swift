//
//  Result.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct Result {
    
    struct MonthDay {
        var month: Int
        var day: Int
    }

    var todofuken: String = "富山県"
    var capital: String = "富山市"
    var citizanDay: MonthDay = MonthDay(month: 5, day: 9)
    var hasCoastLine: Bool = true
    var logoURL: URL = URL(string: "https://japan-map.com/wp-content/uploads/toyama.png")!
    var brief: String = "富山県（とやまけん）は、日本の中部地方に位置する県。県庁所在地は富山市。\n中部地方の日本海側、新潟県を含めた場合の北陸地方のほぼ中央にある。\n※出典: フリー百科事典『ウィキペディア（Wikipedia）』"
    
}
