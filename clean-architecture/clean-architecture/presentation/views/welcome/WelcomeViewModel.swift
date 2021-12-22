//
//  WelcomeViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

protocol WelcomeViewModelOutput: BaseViewModelOutput {
    
}

protocol WelcomeViewModelInput: BaseViewModelInput {
    
    func fooMethod()
}

protocol WelcomeViewModel: BaseViewModel, WelcomeViewModelOutput, WelcomeViewModelInput {

    var fooUseCase: FooUseCase { get set }
}

class DefaultWelcomeViewModel: BaseViewModel, WelcomeViewModel {
    
    var fooUseCase: FooUseCase
    
    init(fooUseCase: FooUseCase, analytics: AnalyticsProtocol) {
        
        self.fooUseCase = fooUseCase
        super.init()
        self.analytics = analytics
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        analytics?.logBackgroundWithLastScreen()
    }
    
    override func viewDidAppear() {
        
        super.viewDidAppear()
        analytics?.logBackgroundWithLastScreen()
    }
    
    func fooMethod() {
        
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
