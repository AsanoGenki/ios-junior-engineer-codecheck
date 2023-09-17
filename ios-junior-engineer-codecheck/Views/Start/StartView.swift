//
//  StartView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var dataController = DataController()
    @State private var isShowingInputView = false
    @State private var isShowingRecordView = false
    @State private var isShowingSettingView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack {
                    VStack(spacing: 20) {
                        Text("都道府県")
                            .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 64))

                        Text("相性占い")
                            .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 64))

                        Text("〜今日相性が良い都道府県を占おう！〜")
                            .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 18))

                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                    
                    Image("nihonchizu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .padding(.top, 20)
                    
                    Button {
                        dataController.playClickNormal()
                        isShowingInputView.toggle()
                    } label: {
                        ButtonView(text: "はじめる", color: .blue)
                    }
                    
                    .navigationDestination(isPresented: $isShowingInputView, destination: {
                        InputView()
                    })
                    .navigationDestination(isPresented: $isShowingRecordView, destination: {
                        RecordView()
                        
                    })
                    
                    .sheet(isPresented: $isShowingSettingView) {
                        SettingView()
                            .presentationDetents([ .fraction(0.4)])
                    }
                    
                    .navigationBarItems(
                        
                        leading: Button {
                            dataController.playClickSmall()
                            isShowingSettingView.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        },
                        
                        trailing: Button {
                            dataController.playClickSmall()
                            isShowingRecordView.toggle()
                        } label: {
                            Image(systemName: "timer")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    )
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
