//
//  MyZstack.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct MyZstack: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .zIndex(2)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .zIndex(1)
            
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .zIndex(0)
        }
    }
}

struct MyZstackProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyZstack()
    }
}
