//
//  CircleImageView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 5, y: 10)
        Image("myImage")
            .resizable()
            .scaledToFill()
//            .aspectRatio(contentMode: .fill) scaledToFill 이랑 같음
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(
                Circle().foregroundColor(.black).opacity(0.7)
            )
            .overlay(
                Circle().stroke(.red,
                                lineWidth: 10)
                    .padding()
            ) // 윤곽선
            .overlay(Circle().stroke(.yellow,
                                    lineWidth: 10)
                .padding(30)
            )
            .overlay(Circle().stroke(.blue,
                                    lineWidth: 10)
            )
            .overlay(
                Text("호호")
                    .foregroundColor(.white)
                    .font(.system(size : 50))
                    .fontWeight(.bold)
            )
//            .clipped()
//            .edgesIgnoringSafeArea(.all) // safeArea 무시
    }
}

struct Previews_CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
