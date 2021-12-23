//
//  NetworkRepository.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

class NetworkRepository: NetworkRepositoryProtocol, Cancellable {

    typealias Request = AnyObject
    var requests = [Request]()

    func cancel() {
        
        requests.forEach { oneRequest in
            // cancel here the networking request
        }
    }
}
