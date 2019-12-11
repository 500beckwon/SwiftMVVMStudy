//
//  RootViewModel.swift
//  MVVMTutorial
//
//  Created by ByungHoon Ann on 2019/12/11.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import Foundation

protocol RootViewModelDelegate  {
    func didStartFetchingMessage(_ message: String?)
    func didFinishFetchingMessage(_ message: String?)
}

class RootViewModel {
    
    var rootViewModelDelegate : RootViewModelDelegate?
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func fetchMessage() {
        rootViewModelDelegate?.didStartFetchingMessage("Fetching.....")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            
            var message: String? = "Change Text after 3 second"
            
            if message == nil {
                message = "Failed to fetch message form server"
            }
            
            self.rootViewModelDelegate?.didFinishFetchingMessage(message)
        }
    }
}
