//
//  MyList.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyList: View {
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        //        List {
        //            ForEach(1...10, id: \.self) {
        //                Text("마이리스트 \($0)")
        //            }
        //        }
        
        List {
            Section(
                header:
                    Text("오늘 할 일")
                    .font(.headline)
                    .foregroundColor(.black),
                footer: Text("footer")
            ) {
                ForEach(1...3, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: .green)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header:
                        Text("내일 할 일")
                .font(.headline)
                .foregroundColor(.black)
            ) {
                ForEach(1...20, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: .blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 30, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
        }
        .listStyle(GroupedListStyle())
        //        .listStyle(PlainListStyle())
        .navigationTitle("내 목록")
//        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = false
        }
        
    } // NavigationView
}

struct MyListProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
