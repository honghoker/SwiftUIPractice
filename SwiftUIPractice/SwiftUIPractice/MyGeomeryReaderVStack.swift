//
//  MyGeomeryReaderVStack.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

enum Index {
    case one, two, three
}

struct MyGeomeryReaderVStack: View {
    
    @State var index: Index = .one
    
    // 지오메트리 프록시를 매개변수로 가지고 CGPoint를 반환하는 클로저
    let centerPosition : (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
//                Rectangle().frame(height: 0)
                
                Button(action: {
                    print("1번이 클릭 되었습니다.")
                    withAnimation {
                        self.index = .one
                    }
                    
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width : 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .one ? 50 : 0)
                        .background(.red)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    print("2번이 클릭 되었습니다.")
                    withAnimation {
                        self.index = .two
                    }
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width : 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .two ? 50 : 0)
                        .background(.blue)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    print("3번이 클릭 되었습니다.")
                    withAnimation {
                        self.index = .three
                    }
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width : 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .three ? 50 : 0)
                        .background(.green)
                        .foregroundColor(.white)
                }
            } // VStack
//            .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
            .position(centerPosition(proxy))
        } // GeometryReader
        .background(.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyGeomeryReaderVStackProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyGeomeryReaderVStack()
    }
}
