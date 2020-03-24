//
//  ResponseStatus.swift
//  Covid19
//
//  Created by Solayman Rana on 24/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//


import Foundation
class ResponseStatus{
    var isSuccess : Bool = false
    var responnseCode : Int = 0
    var msg : String = ""
    
    
    init(isSuccess : Bool,resCode : Int,msg : String) {
        self.isSuccess = isSuccess
        self.msg = msg
        responnseCode = resCode
    }
}
