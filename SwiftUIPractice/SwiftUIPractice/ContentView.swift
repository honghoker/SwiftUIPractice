//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    
//    @State
//    private var isActivated: Bool = false
//
//    static let dateFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY년 M월 d일"
//        return formatter
//    }()
//
//    var today = Date()
    
    var body: some View {

        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }
                .padding(20)
                Text("정대리 할 일 목록")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .padding(.horizontal, 20)
                
                ScrollView {
                    VStack {
                        MyProjectCard()
                        MyBasicCard()
                        MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .blue)
                        MyCard(icon: "cart.fill", title: "카트 정리하기", start: "10 AM", end: "11 AM", bgColor: .red)
                        MyCard(icon: "docs.fill", title: "문서 정리하기", start: "10 AM", end: "11 AM", bgColor: .yellow)
                        MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: .orange)
                    }.padding()
                }
            }
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                )
                .padding(.trailing, 10)
                .shadow(radius: 20)
        }
        //        NavigationView {
        
//        MyVstackView()
//                HStack {
//                    MyVstackView(isActivated: $isActivated)
//                    MyVstackView(isActivated: $isActivated)
//                    MyVstackView(isActivated: $isActivated)
//                }
//                .padding(isActivated ? 50.0 : 10.0)
//                .background(isActivated ? .yellow : .black)
//                .onTapGesture {
//                    withAnimation {
//                        self.isActivated.toggle()
//                    }
//                }
//                CircleImageView()
//                Text("asdkaspodksapodk. qweoqwkepoaskdpakspdkoasod. asdoaksdp,q qweqweok paksdpokpozxkcpakspod. ")
//                    .tracking(2) // 자간
//                    .lineSpacing(20)
//                    .multilineTextAlignment(.center)
//                    .multilineTextAlignment(.center)
//                    .lineLimit(nil)
//                    .padding(20)
//                    .background(.yellow)
//                    .cornerRadius(20)
//                    .padding()
//                    .background(.green)
//                    .cornerRadius(20)
                    
//                Text("오늘의 날짜입니다 : \(today, formatter: ContentView.dateFormat)")
//                    .background(.gray)
//                    .foregroundColor(.blue)
                // 네비게이션 버튼(링크)
//                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
//                    Text("네비게이션")
//                        .fontWeight(.bold)
//                        .font(.system(size: 40))
//                        .padding()
//                        .background(.orange)
//                        .foregroundColor(.white)
//                        .cornerRadius(30)
//                }.padding(.top, 50.0)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

