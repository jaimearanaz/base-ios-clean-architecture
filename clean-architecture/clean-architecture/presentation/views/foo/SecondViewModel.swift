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
        
        let oneCancellable =
            fooUseCase.execute(request: FooUseCaseRequest(param1: "", param2: 0),
                               completion: { result in
                                
                                switch result {
                                
                                case .success(let entity):
                                    self.foo.value = entity.toPresentation()
                                case .failure(let error):
                                    print(error)
                                }
                                print("")
                               })
        cancellables.append(oneCancellable)
    }
}
