//
//  GetSomeData.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import SwiftyTimer

extension NetworkRepository {
    
    func getSomeData(completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable {
        
        Timer.after(2) {
            let data = FooDTO(param1: "This is coming from data layer!", param2: 0, param3: true)
            completion(.success(data.toDomain()))
            //completion(.failure(AppError.NoConnectionError))
            //completion(.failure(AppError.HttpNotFoundError))
            self.requests.removeFirst(object: self)
        }
        
        requests.append(self)
        return self
    }
}
