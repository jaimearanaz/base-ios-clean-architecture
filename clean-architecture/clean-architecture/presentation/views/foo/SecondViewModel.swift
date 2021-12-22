//
//  SecondViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

protocol SecondViewModelOutput: BaseViewModelOutput {
    
}

protocol SecondViewModelInput: BaseViewModelInput {

}

protocol SecondViewModel: BaseViewModel, SecondViewModelOutput, SecondViewModelInput {

    var fooUseCase: FooUseCase { get set }
}

class DefaultSecondViewModel: BaseViewModel, SecondViewModel {

    var fooUseCase: FooUseCase
    
    init(fooUseCase: FooUseCase, analytics: AnalyticsProtocol) {
        
        self.fooUseCase = fooUseCase
        super.init()
        self.analytics = analytics
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fooUseCase.execute(request: FooUseCaseRequest(param1: "", param2: 0),
                         completion: { result in
                            
                            switch result {
                            
                            case .success(let entity):
                                print(entity)
                            case .failure(let error):
                                print(error)
                            }
                            print("")
                         })
    }
}
