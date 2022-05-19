//
//  MyViewModel.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/20.
//

import Foundation
import Combine

class MyViewModel: ObservableObject {
    @Published var appTitle: String = "빡코딩의 일상"
}
