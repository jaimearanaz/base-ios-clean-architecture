//
//  WelcomeViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

enum WelcomeOperation: OperationId {
    case foo = 1000
}

enum WelcomeError: Error {
    case notFound(OperationId)
}

enum WelcomeTransition: TransitionId {
    case toSecond
}

protocol WelcomeViewModelOutput: BaseViewModelOutput {
    var foo: Box<FooUi> { get set }
}

protocol WelcomeViewModelInput: BaseViewModelInput {
    func didSelectNext()
}

protocol WelcomeViewModel: BaseViewModel, WelcomeViewModelOutput, WelcomeViewModelInput {
    
    var fooUseCase: FooUseCase { get set }
}

class DefaultWelcomeViewModel: BaseViewModel, WelcomeViewModel {
        
    var fooUseCase: FooUseCase
    var foo = Box(FooUi(param1: ""))
    
    init(fooUseCase: FooUseCase, analytics: AnalyticsProtocol) {
        
        self.fooUseCase = fooUseCase
        super.init()
        self.analytics = analytics
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        analytics?.logBackgroundWithLastScreen()
        fooMethod()
    }
    
    override func viewDidAppear() {
        
        super.viewDidAppear()
        analytics?.logBackgroundWithLastScreen()
    }
    
    func fooMethod() {
        
        let id = WelcomeOperation.foo.rawValue
        loading.value = (id, true)
        
        let oneCancellable =
            fooUseCase.execute(request: FooUseCaseRequest(param1: "", param2: 0),
                               completion: { result in
                                
                                self.loading.value = (id, false)
                                
                                switch result {
                                
                                case .success(let entity):
                                    self.foo.value = entity.toPresentation()
                                    self.result.value = .success(id)
                                
                                case .failure(let error):
                                    
                                    switch error {
                                    case AppError.NoConnectionError:
                                        self.result.value = .failure(BaseViewModelError.noInternet(id))
                                    default:
                                        self.result.value = .failure(BaseViewModelError.unknown(id))
                                    }
                                }
                               })
        
        cancellables.append(oneCancellable)
    }
    
    func didSelectNext() {
        transition.value = WelcomeTransition.toSecond.rawValue
    }
}
