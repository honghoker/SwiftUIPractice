//
//  STBMainView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/20.
//

import Foundation
import SwiftUI

struct STBMainView: View {
    @EnvironmentObject var viewModel: MyViewModel
    
    @State var count: Int = 0
    
    @State var appTitle: String = ""
    
//    var appTitle: String
//
//    init(appTitle: String = "빡코딩의 일상") {
//        self.appTitle = appTitle
//    }
    
    
    var body: some View {
        TabView {
            VStack {
                Text("오늘도 빡코딩! count : \(count)")
                    .padding()
                Button(action: {
                    count = count + 1
                    viewModel.appTitle = "빡코딩의 일상 \(count)일차"
                }, label: {
                    Text("카운트 업")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                })
            }
            .tabItem { Label("오늘도", systemImage: "pencil.circle") }
            
            BeforeBadView(count: $count)
                .tabItem {
                    Label("자기전에", systemImage: "folder.fill")
                }
           WeeklyView(count: $count)
                .tabItem {
                    Label("주말에도", systemImage: "paperplane.fill")
                }
        }
        .overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
        .onReceive(viewModel.$appTitle) { receivedAppTitle in
            print("STBMainView receivedAppTitle : \(receivedAppTitle)")
            appTitle = receivedAppTitle
        }
    }
}

//struct STBMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        STBMainView()
//    }
//}
