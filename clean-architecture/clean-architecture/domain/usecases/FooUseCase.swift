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

protocol FooUseCase: BaseUseCase {

    var networkRepository: NetworkRepositoryProtocol { get set }
    
    @discardableResult
    func execute(request: FooUseCaseRequest,
                 completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable
    
}

class DefaultFooUseCase: FooUseCase {
    
    var networkRepository: NetworkRepositoryProtocol
    
    init(network: NetworkRepositoryProtocol) {
        self.networkRepository = network;
    }
    
    func execute(request: FooUseCaseRequest, completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable {

        networkRepository.getSomeData(completion: completion)
        return DefaultCancellable()
    }
}
