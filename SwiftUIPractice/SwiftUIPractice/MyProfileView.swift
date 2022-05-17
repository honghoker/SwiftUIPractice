//
//  MyProfileView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyProfileView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MyCircleImageView(imageString: "myImage")
                Text("개발하는 정대리")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                Spacer()
                    .frame(height: 20)
                Text("구독 좋아요 부탁드립니다!")
                    .font(.system(size: 25))
                    .fontWeight(.black)
                HStack {
                    Text("구독하러 가기")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(20)
                    
                    Text("오픈깨톡방 가기")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(20)
                    
                } // HStack
                .padding(20)
                Spacer()
            } // VStack
        } // ScrollView
        .navigationTitle("내 프로필")
        .navigationBarItems(trailing:
                                NavigationLink(destination:
                                                Text("설정화면입니다.")
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                              ) {
            Image(systemName: "gear")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
        )
        .onAppear() {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyProfileViewProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
