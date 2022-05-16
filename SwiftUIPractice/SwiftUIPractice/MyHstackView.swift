//
//  MyHstackView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct MyHstack: View {
    var body: some View {
        HStack(alignment: .center) {
//            Divider()
//            Rectangle()
//                .frame(width : 100)
//                .foregroundColor(.red)
//            Rectangle()
//                .frame(width : 100, height: 100)
//                .foregroundColor(.red)
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 70))
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.yellow)
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.blue)
        }
        .background(.green)
    }
}

struct MyHstack_Previews: PreviewProvider {
    static var previews: some View {
        MyHstack()
    }
}
