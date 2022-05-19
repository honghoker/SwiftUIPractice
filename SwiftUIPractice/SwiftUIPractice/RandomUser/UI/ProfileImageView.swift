//
//  UI.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/19.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImageView: View {
    var imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
        .frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.yellow, lineWidth: 2)
        )
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/14.jpg")!
        
        ProfileImageView(imageUrl: url)
    }
}
