//
//  DarkModeMainView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/20.
//

import SwiftUI


struct DarkModeMainView: View {
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
            Theme.myBackgroundColor(forScheme: scheme)
            VStack {
                Spacer()
                
                Button(action: {
                    print("버튼이 클릭되었다.")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인하러 가기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(.white, lineWidth: 3)
                        )
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("안녕하세요?!"), message: Text("오늘도 빡코딩!"), dismissButton: .default(Text("닫기")))
                })
                Spacer().frame(height: 100)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DarkModeMainView_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeMainView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.white
        let darkColor = Color.black
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default: return lightColor
        }
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        let darkColor = Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default: return lightColor
        }
    }
}
