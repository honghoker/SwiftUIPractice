//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var selectionValue = 0

    
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
        
        NavigationView {
            
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        HStack {
                            NavigationLink(destination: MyGeomeryReaderVStack()) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: MyProfileView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(20)
                        Text("정대리 할 일 목록")
                            .font(.system(size: 40))
                            .fontWeight(.black)
                            .padding(.horizontal, 20)
                        
                        ScrollView {
                            
//                            Picker("피커", selection: $selectionValue, content: {
//                                Text("수박").tag(0)
//                                Text("바나나").tag(1)
//                                Text("딸기").tag(2)
//                            })
//                            .pickerStyle(.wheel)
                            
                            //                        Button(action: {
                            //                            print("@@@@@@@")
                            //                        }, label: {
                            //                            Text("탭")
                            //                        }).buttonStyle(MyButtonStyle(color: .blue, type: .tab))
                            //                        Button(action: {
                            //                            print("@@@@@@@")
                            //                        }, label: {
                            //                            Text("롱클릭")
                            //                        }).buttonStyle(MyButtonStyle(color: .green, type: .long))
                            
                            //                            HStack {
                            //                                TextField("사용자 이름", text: $username)
                            //                                    .autocapitalization(.none)  // 대문자 끄기
                            //                                    .disableAutocorrection(true) // 자동완성 끄기
                            //                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            //                                if self.username.count > 0 {
                            //                                    Button(action : {
                            //                                        self.username = ""
                            //                                    }) {
                            //                                        Image(systemName: "multiply.circle.fill")
                            //                                            .font(.system(size: 25))
                            //                                            .foregroundColor(.secondary)
                            //                                    }
                            //                                }
                            //                            }
                            //                            HStack {
                            //                                SecureField("비밀번호", text: $password)
                            //                                    .autocapitalization(.none)  // 대문자 끄기
                            //                                    .disableAutocorrection(true) // 자동완성 끄기
                            //                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            //                                if self.password.count > 0 {
                            //                                    Button(action : {
                            //                                        self.password = ""
                            //                                    }) {
                            //                                        Image(systemName: "multiply.circle.fill")
                            //                                            .font(.system(size: 25))
                            //                                            .foregroundColor(.secondary)
                            //                                    }
                            //                                }
                            //                            }
                            //
                            //                            Text("입력한 비번 : \(password)")
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
            } // ZStack
            .navigationTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        } // NavigationView
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

