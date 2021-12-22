//
//  Cancellable.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

protocol Cancellable {
    
    func cancel()
}

class DefaultCancellable: Cancellable {
    
    func cancel() {
        
    }
}
