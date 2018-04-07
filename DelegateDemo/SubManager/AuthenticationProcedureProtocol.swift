//
//  AuthenticationProcedureProtocol.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

protocol AuthenticationProcedureProtocol {
    
    associatedtype inputType
    associatedtype outputType
    
    var complete: Delegate<inputType, outputType> { get set }
    
    associatedtype startInputType
    func start(_ input: startInputType)
    
    associatedtype finishInputType
    func finish(_ output: finishInputType)
    
}
