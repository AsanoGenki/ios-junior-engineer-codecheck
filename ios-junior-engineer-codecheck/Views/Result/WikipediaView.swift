//
//  WikipediaView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/16/23.
//

import SwiftUI

struct WikipediaView: View {
    @Binding var todofuken: String
    @Binding var brief: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(brief)
                .padding(.top, 20)
                .lineSpacing(7)
            
            if let url = wikiURL(todofuken: todofuken) {
                        Link("もっと詳しく読む", destination: url)
                    }
            Spacer()
        }
        .font(.custom("RoundedMplus1c-Medium", size: 18))
        .padding(.horizontal)
    }
    
    func wikiURL(todofuken: String) -> URL {
        let urlString = "https://ja.wikipedia.org/wiki/\(todofuken)"
        let encodeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: encodeUrlString)!
    }
    
}

struct WikipediaView_Previews: PreviewProvider {
    
    @State static var todofuken = "富山県"
    @State static var brief = "富山県（とやまけん）は、日本の中部地方に位置する県。県庁所在地は富山市。\n中部地方の日本海側、新潟県を含めた場合の北陸地方のほぼ中央にある。\n※出典: フリー百科事典『ウィキペディア（Wikipedia）』"
    
    static var previews: some View {
        WikipediaView(todofuken: $todofuken, brief: $brief)
    }
}
