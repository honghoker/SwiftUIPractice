//
//  MyNavigationView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/17.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            MyList()
            
                .navigationTitle("안녕하세요!")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            print("호호")
                        }) {
                            Text("호호")
                        },
                    trailing:
                        NavigationLink(destination:
                                        Text("넘어온 화면입니다.")
                                      ) {
                        Image(systemName: "bookmark.fill")
                                              .font(.system(size: 25))
                                              .foregroundColor(.green)
                    }
                )
        }
    }
}


struct MyNavigationViewProvider_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
