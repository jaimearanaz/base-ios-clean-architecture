//
//  SecondViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

protocol SecondViewModelOutput: BaseViewModelOutput {
 
    var foo: Box<FooUi> { get set }
}

protocol SecondViewModelInput: BaseViewModelInput {
 
    func fooMethod()
}

protocol SecondViewModel: BaseViewModel, SecondViewModelOutput, SecondViewModelInput {
    
    var fooUseCase: FooUseCase { get set }
}

class DefaultSecondViewModel: BaseViewModel, SecondViewModel {
    
    var fooUseCase: FooUseCase
    var foo = Box(FooUi(param1: ""))
    
    init(fooUseCase: FooUseCase, analytics: AnalyticsProtocol) {
        
        self.fooUseCase = fooUseCase
        super.init()
        self.analytics = analytics
    }

    func fooMethod() {
        
        let id = BaseViewModelOperation.anyone.rawValue
        loading.value = (id, true)
        
        let oneCancellable =
            fooUseCase.execute(request: FooUseCaseRequest(param1: "", param2: 0),
                               completion: { result in
                                
                                self.loading.value = (id, false)
                                
                                switch result {
                                
                                case .success(let foo):
                                    self.foo.value = foo.toPresentation()
                                    self.result.value = .success(id)
                                case .failure(let error):
                                    self.result.value = .failure(error)
                                }
                               })
        cancellables.append(oneCancellable)
    }
}
