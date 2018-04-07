//
//  TokenVerifier.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

class TokenVerifier: AuthenticationProcedureProtocol {
    
    enum Result {
        enum FailureReason: String {
            case tokenExpired = "tokenExpired"
            case tokenNotMatch = "tokenNotMatch"
        }
        
        case success
        case failed(FailureReason)
    }
    
    var complete = Delegate<Result, Void>()
    
    func start(_ input: String) {
        // Start process
    }
    
    func finish(_ output: Result) {
        // Do something before call back
        complete.call(output)
    }
    
}
