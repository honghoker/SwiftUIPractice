//
//  MainView.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/19.
//

import SwiftUI
import UIKit
import Introspect

class RefreshControlHelper {
    var parentContentView: MainView?
    var refreshControl: UIRefreshControl?
    
    @objc func didRefresh() {
        print(#fileID, #function, #line, "")
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            print("parentContentView, refreshControl 가 nil 입니다.")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            print("리프레시가 되었다.")
            // MARK: - TODO : API 다시 땡기기
            //            parentContentView.randomUserViewModel.fetchRandomUser()
            parentContentView.randomUserViewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        })
    }
}

struct MyBottomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .orange))
            .scaleEffect(1.7, anchor: .center)
    }
}

struct MainView: View {
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { aRandomUser in
            
            RandomUserRowView(aRandomUser)
                .onAppear() { fetchMoreData(aRandomUser) }
        }
        .introspectTableView { self.configureRefreshControl($0) }
        
        
        // 데이터 로딩 중이라면
        if randomUserViewModel.isLoading {
            MyBottomProgressView()
        }
        
    }
}


// MARK: - Helper Methods
extension MainView {
    fileprivate func fetchMoreData(_ randomUser: RandomUser) {
        print(#fileID, #function, #line, "")
        if self.randomUserViewModel.randomUsers.last == randomUser {
            print("[마지막]에 도달했다")
            randomUserViewModel.fetchMoreActionSubject.send()
        }
    }
    
    fileprivate func configureRefreshControl(_ tableView: UITableView) {
        print(#fileID, #function, #line, "")
        let myRefresh =  UIRefreshControl()
        myRefresh.tintColor = .orange
        refreshControlHelper.refreshControl = myRefresh
        refreshControlHelper.parentContentView = self
        myRefresh.addTarget(refreshControlHelper, action: #selector(refreshControlHelper.didRefresh), for: .valueChanged)
        
        tableView.refreshControl = myRefresh
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
