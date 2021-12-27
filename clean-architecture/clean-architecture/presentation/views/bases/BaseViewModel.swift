//
//  BaseViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

enum BaseViewModelState: Int {
    
    case neutral = 1000
    case success = 1001
    case error = 1002
    case noInternet = 1003
}

protocol BaseViewModelOutput {

    var state: Box<Int> { get set }
}

protocol BaseViewModelInput {
    
    func viewDidLoad()
    func viewDidAppear()
    func viewWillDisappear()
}

protocol BaseViewModelProtocol: BaseViewModelOutput, BaseViewModelInput {
 
    var analytics: AnalyticsProtocol? { get set }
    var cancellables: [Cancellable] { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    
    var state = Box(BaseViewModelState.neutral.rawValue)
    var analytics: AnalyticsProtocol?
    var cancellables = [Cancellable]()
    
    func viewDidLoad() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() {
        cancellables.forEach { $0.cancel() }
    }
    
    func handleError(error: Error) {
        
        switch error {
        case AppError.NoConnectionError:
            self.state.value = BaseViewModelState.noInternet.rawValue
        default:
            self.state.value = BaseViewModelState.error.rawValue
        }
    }
}
