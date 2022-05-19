//
//  TodayView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/20.
//

import SwiftUI

struct BeforeBadView: View {
    @EnvironmentObject var viewModel: MyViewModel
    
    @Binding var count: Int
    
    @State var title: String = ""
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding()
            Text("자기전에 빡코딩! count : \(count)")
                .padding()
            Button(action: {
                count = count + 1
            }, label: {
                Text("카운트 업")
                    .foregroundColor(.white)
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
            })
        }
        .onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("BeforeBadView receivedAppTitle : ", receivedAppTitle)
            title = receivedAppTitle
        })
        
    }
}
