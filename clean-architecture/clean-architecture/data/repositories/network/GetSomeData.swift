//
//  GetSomeData.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

extension NetworkRepository {
    
    func getSomeData(completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable {
        
        let data = FooDTO(param1: "This is my data from source", param2: 0, param3: true)
        completion(.success(data.toDomain()))
        return DefaultCancellable()
    }
}
