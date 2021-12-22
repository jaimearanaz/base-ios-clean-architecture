//
//  NetworkRepositoryProtocol.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

protocol NetworkRepositoryProtocol {
    
    @discardableResult
    func getSomeData(completion: @escaping (Result<FooEntity, Error>) -> Void) -> Cancellable;
    
    @discardableResult
    func sendSomeData(data: FooEntity, completion: @escaping (Result<Void, Error>) -> Void) -> Cancellable;
}
