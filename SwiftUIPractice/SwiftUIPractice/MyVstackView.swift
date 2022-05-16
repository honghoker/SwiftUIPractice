//
//  MyVstackView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct MyVstackView: View {
    
//    // 데이터 연동
//    @Binding
//    var isActivated: Bool
//
//    // 생성자
//    init(isActivated: Binding<Bool> = .constant(false)) {
//        _isActivated = isActivated
//    }
    
//    var body: some View {
//        VStack {
//            Text("1!")
//                .fontWeight(.bold)
//                .font(.system(size: 32))
//            Text("2!")
//                .fontWeight(.bold)
//                .font(.system(size: 32))
//            Text("3!")
//                .fontWeight(.bold)
//                .font(.system(size: 32))
//        }
//        .background(self.isActivated ? .green : .red)
//        .padding(self.isActivated ? 10 : 0)
//    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
                Divider()
                    .opacity(0)
//            Rectangle()
//                .frame(height: 20)
                Text("글자")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
            
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)
//                    .padding(.bottom, 100)
            
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
//                    .padding(.vertical, 100)
            
                Spacer()
                    .frame(height: 50)
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
        }.frame(width: 300)
            .background(.green)
    }
}

struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}

