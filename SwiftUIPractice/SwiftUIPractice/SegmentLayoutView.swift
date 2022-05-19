//
//  SegmentLayoutView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/19.
//

import SwiftUI

// Foreach를 사용하려면 CaseIterable 설정
enum LayoutType: CaseIterable {
    case table, grid, multiple
}

extension LayoutType {
    // 레이아웃 타입에 대한 컬럼이 자동으로 설정되도록 한다
    var columns: [GridItem] {
        switch self {
        case .table:
            return [
                // flexible 하나로 한줄로 표현
                GridItem(.flexible())
            ]
        case .grid:
            // flexible 두개를 넣어서 두개의 아이템이 들어가게 함
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]
        case .multiple:
           return [
            // adaptive를 통해 크기 닿는데까지 아이템을 여러개 넣기
            GridItem(.adaptive(minimum: 100))
           ]
        }
    }
}

struct SegmentLayoutView: View {
    var dummyDatas = MyModel.dummyDataArray
    @State var selectedLayoutType: LayoutType = .table
    
    var body: some View {
        VStack {
            // 피커
            Picker(selection: $selectedLayoutType, label: Text("레이아웃 타입"), content: {
                ForEach(LayoutType.allCases, id: \.self, content: { layoutType in
                    switch layoutType {
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                })
            })
            .frame(width: 250)
            .pickerStyle(.segmented)
            
            // 내용물
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns, content: {
                    ForEach(dummyDatas) { dataItems in
                        switch  selectedLayoutType {
                        case .table:
                            MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: .green)
//                            Rectangle()
//                                .foregroundColor(.blue)
//                                .frame(height: 100)
                        case .grid:
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.red)
                                .frame(height: 200)
                                .overlay(
                                    VStack(spacing: 2) {
                                        Circle()
                                            .frame(height:100)
                                            .foregroundColor(.yellow)
                                        Spacer().frame(height: 10)
                                        Text("\(dataItems.title)")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                        Text("\(dataItems.content)")
                                    }
                                )
                        case .multiple:
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(height: 100)
                        }
                    }
                })
                .animation(.easeInOut)
                .padding(.horizontal, 10)
            }
            
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
