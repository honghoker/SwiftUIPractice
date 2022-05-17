//
//  MyCircleImageView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyCircleImageView: View {
    var imageString: String
    
    var body: some View {
            Image(imageString)
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .overlay(
                Circle()
                    .strokeBorder(.yellow, lineWidth: 15)
            )
    }
}

struct MyCircleImageViewProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyCircleImageView(imageString: "myImage")
    }
}
