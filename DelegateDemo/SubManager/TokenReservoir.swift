//
//  TokenReservoir.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

class TokenReservoir: AuthenticationProcedureProtocol {
    
    enum Result {
        enum FailureReason: String {
            case noDataInKeychain = "noDataInKeychain"
            case cannotRebuildModel = "cannotRebuildModel"
        }
        
        case success(String)
        case failed(FailureReason)
    }
    
    var complete = Delegate<Result, Void>()
    
    func start(_ input: String) {
        //Do the work
    }
    
    func finish(_ output: Result) {
        //Do the work, finish the job
        complete.call(output)
    }
    
}
