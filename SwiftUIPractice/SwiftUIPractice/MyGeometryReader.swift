//
//  MyGeometryReader.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyGeoMetryReader: View {
    var body: some View {
        
        GeometryReader { geometryReader in
            HStack(spacing: 0) {
                Text("1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometryReader.size.width / 3)
                    .foregroundColor(.white)
                    .background(.red)
                Text("2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometryReader.size.width / 2)
                    .foregroundColor(.white)
                    .background(.blue)
                Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometryReader.size.width / 4)
                    .foregroundColor(.white)
                    .background(.green)
                Text("4")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometryReader.size.width / 4)
                    .foregroundColor(.white)
                    .background(.purple)
            }
            .background(.yellow)
        }
        .background(.black)
        
     
        
    }
}


struct MyGeoMetryReaderProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyGeoMetryReader()
    }
}
