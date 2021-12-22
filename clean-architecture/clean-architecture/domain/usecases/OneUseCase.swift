//
//  OneUseCase.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

struct FooUseCaseRequest {
    
    var param1: String
    var param2: Int
}

protocol FooUseCase: BaseUseCase where Request == FooUseCaseRequest, Response == FooEntity {

}

class DefaultOneUseCase: FooUseCase {
    
    func execute(request: FooUseCaseRequest, completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable {
        
        completion(.success(FooEntity(param1: "This is my entity", param2: 0, param3: true)))
        return DefaultCancellable()
    }
}

class DefaultCancellable: Cancellable {
    
    func cancel() {
        
    }
}
