//
//  AuthenticationManager.swift
//  DelegateDemo
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

class AuthenticationManager {
    var verifier: TokenVerifier
    var oauthManager: OauthManager
    var tokenReservoir: TokenReservoir
    
    // DI
    init(verifier: TokenVerifier, oauthManager: OauthManager, tokenReservoir: TokenReservoir) {
        self.verifier = verifier
        self.oauthManager = oauthManager
        self.tokenReservoir = tokenReservoir
    }
    
    func setupDelegate() {
        
        // Token Verifier
        verifier.complete.delegate(on: self) { (self, result) in
            switch result {
            case let .failed(failedReason):
                print(failedReason.rawValue)
                //Do something
            case .success:
                print("Successfully verified token")
                //Do something
            }
        }
        
        //Oauth Manager
        oauthManager.complete.delegate(on: self) { (self, result) in
            switch result {
            case .failed:
                print("Oauth failed")
                //Do something
            case .success:
                print("Oauth succeeded")
                //Do something
            }
        }
        
        tokenReservoir.complete.delegate(on: self) { (self, result) in
            switch result {
            case let .failed(failedReason):
                print(failedReason)
                //Do something
            case let .success(token):
                print(token)
                //Do something
            }
        }
        
    }
}
