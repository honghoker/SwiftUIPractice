//
//  MyBasicCard.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "flag.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading , spacing: 0) {
                Divider().opacity(0)
                Text("하하")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 8)
                
                Text("하하")
                    .foregroundColor(.white)
            }
            
            
        }
        .padding(30)
        .background(.purple)
        .cornerRadius(20)
    }
}


struct MyBasicCardProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
