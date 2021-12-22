//
//  SendSomeData.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

extension NetworkRepository {
 
    func sendSomeData(data: FooEntity, completion: @escaping (Result<Void, Error>) -> Void) -> Cancellable {
        
        _ = data.toData()
        completion(.success(Void()))
        return DefaultCancellable()
    }
}
