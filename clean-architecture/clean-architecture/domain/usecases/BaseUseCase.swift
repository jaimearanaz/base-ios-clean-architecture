//
//  BaseUseCase.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

protocol BaseUseCase: Cancellable {

    var cancellables: [Cancellable] { get set }
}

extension BaseUseCase {
    
    func cancel() {
        
        // do any additional stuff to cancel the data request
        cancellables.forEach { $0.cancel() }
    }
}
