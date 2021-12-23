//
//  SendSomeData.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import SwiftyTimer

extension NetworkRepository {
 
    func sendSomeData(data: FooEntity, completion: @escaping (Result<Void, Error>) -> Void) -> Cancellable {
        
        Timer.after(2) {
            _ = data.toData()
            completion(.success(Void()))
            self.requests.removeFirst(object: self)
        }
        
        requests.append(self)
        return self
    }
}
