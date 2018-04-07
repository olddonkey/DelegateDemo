//
//  OauthManager.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

class OauthManager: AuthenticationProcedureProtocol {    
    
    enum Result {
        case success
        case failed
    }
    
    var complete = Delegate<Result, Void>()
    
    func start(_ input: String = "test") {
        //Start Oauth process
    }
    
    func finish(_ output: Result) {
        //Do something before call back
        complete.call(output)
    }
}
