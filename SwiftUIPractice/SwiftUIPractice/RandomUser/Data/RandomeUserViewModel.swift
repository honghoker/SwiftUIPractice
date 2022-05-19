//
//  RandomeUserViewModel.swift
//  SwiftUIPractice
//
//  Created by 홍은표 on 2022/05/19.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    @Published var pageInfo: Info? {
        didSet {
            print("pageInfo: \(pageInfo?.description)")
        }
    }
    
    @Published var isLoading : Bool = false
    
    var refreshActionSubject = PassthroughSubject<(), Never>()
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
//    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUser()
        
        refreshActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            print("RandomUserViewModel - init - refreshActionSubject")
            self.fetchRandomUser()
        }.store(in: &subscription)
        
        fetchMoreActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            print("RandomUserViewModel - init - refreshActionSubject")
            if !self.isLoading {
                self.fetchMore()
            }
        }.store(in: &subscription)
    }
    
    fileprivate func fetchMore() {
        print(#fileID, #function, #line, "")
        guard let currentPage = pageInfo?.page else {
            print("페이지 정보가 없습니다.")
            return
        }
        
        self.isLoading = true
        let pageToLoad = currentPage + 1
        
        AF.request(RandomUserRouter.getUsers(page: pageToLoad))
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value } // optional한 값을 unWrapping
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료")
                self.isLoading = false
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.results.count)")
                self.randomUsers += receivedValue.results
                self.pageInfo = receivedValue.info
            })
            .store(in: &subscription)
        
    }
    
    fileprivate func fetchRandomUser(){
        print(#fileID, #function, #line, "")
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value } // optional한 값을 unWrapping
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료")
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.results.count)")
                self.randomUsers = receivedValue.results
                self.pageInfo = receivedValue.info
            })
            .store(in: &subscription)
    }
}

