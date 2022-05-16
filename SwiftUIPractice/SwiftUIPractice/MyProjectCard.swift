//
//  MyProjectCard.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            
            Text("정대리 유튭 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
            
            Spacer().frame(height: 20)
            HStack() {
                Image("myImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.red)
                    )
                Image("myImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("myImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                Button(action: {
                    print("@@@@@@@@ touch")
                    self.shouldShowAlert = true
                }){
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창 입니다"))
                }
                
                    
            }
        }
        .padding(30)
        .background(.yellow)
        .cornerRadius(20)
        
    }
}

struct MyProjectCardProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
            .previewInterfaceOrientation(.portrait)
    }
}
