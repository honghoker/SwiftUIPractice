//
//  GestureMainView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/20.
//

import SwiftUI

struct GestureMainView: View {
    
    @State var singleTapped = false
    @State var doubleTapped = false
    @State var trippleTapped = false
    
    
    
    var singleTap: some Gesture {
        TapGesture()
            .onEnded { _ in
                print("한번 탭했다.")
                singleTapped.toggle()
            }
    }
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                print("두번 탭했다.")
                doubleTapped.toggle()
            }
    }
    var trippleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                print("세번 탭했다.")
                trippleTapped.toggle()
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(singleTapped ? .gray : .blue)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("싱글탭").circleTitle()
                )
                .gesture(singleTap)
            Circle()
                .fill(doubleTapped ? .gray : .orange)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("더블탭").circleTitle()
                )
                .gesture(doubleTap)
            Circle()
                .fill(trippleTapped ? .gray : .green)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("트리플탭").circleTitle()
                )
                .gesture(trippleTap)
        }
    }
}

struct GestureMainView_Previews: PreviewProvider {
    static var previews: some View {
        GestureMainView()
    }
}

struct CircleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 26))
            .foregroundColor(.white)
    }
}

extension View {
    func circleTitle() -> some View {
        modifier(CircleTitle())
    }
}
