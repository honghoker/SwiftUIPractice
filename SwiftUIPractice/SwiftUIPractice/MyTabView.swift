//
//  MyTabView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            Text("1번")
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
                
            Text("2번")
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(0)
            
            Text("3번")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(0)
        }
        
        
    }
}

struct MyTabViewProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
