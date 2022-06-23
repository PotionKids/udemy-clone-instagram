//
//  Logging.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/23/22.
//

import Foundation

enum LOGGING {
    enum DEBUG: String {
        case SUCCESS
        case FAILURE
        
        var head: String {
            punctuate(Constants.DEBUG)
        }
        
        var punctuated: String {
            punctuate(rawValue)
        }
        
        func punctuate(_ value: String) -> String {
            value + Constants.colon + Constants.space
        }
        
        func log(message: String) -> String {
            head + punctuated + message
        }
    }
}
