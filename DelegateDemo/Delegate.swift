//
//  Delegate.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

class Delegate<Input, Output> {
    private var block: ((Input) -> Output?)?
    func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
    
    @discardableResult
    func call(_ input: Input) -> Output? {
        return block?(input)
    }
}

extension Delegate where Input == Void {
    @discardableResult
    func call() -> Output? {
        return call(())
    }
}
