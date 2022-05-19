//
//  MyLazyVGrid.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/19.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

extension MyModel {
    static var dummyDataArray: [MyModel] {
        (1...2000).map{ (number: Int) in
            MyModel(title: "타이틀: \(number)", content: "컨텐트: \(number)")
        }
    }
}

struct MyLazyVGrid: View {
    
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        ScrollView {
            // .fixed 고정
            // .adaptive 여러개 채우기 - 계산해서 분할로 채우기
            // .flexible 하나만 채우기 - 계산해서 분할로 채우기
            LazyVGrid(columns: [GridItem(.fixed(50)),
                                GridItem(.adaptive(minimum: 50)),
                                GridItem(.flexible(minimum: 50)),
                                         ], spacing: 10, content: {
                ForEach(dummyDataArray, content: { (dataItem: MyModel) in
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 120)
                        .overlay(
                            Text("\(dataItem.title)")
                        )
                    
                })
            })
        }
    }
}

struct MyLazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        MyLazyVGrid()
    }
}
