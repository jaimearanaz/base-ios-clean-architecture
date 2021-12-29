//
//  BaseViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

typealias OperationId = Int
typealias TransitionId = String
typealias Loading = (operationId: OperationId, isLoading: Bool)

enum BaseViewModelOperation: OperationId {
    case anyone = 0
}

enum BaseViewModelError: Error {
    
    case unknown(OperationId)
    case noInternet(OperationId)
}

enum BaseViewModelTransition: TransitionId {
    
    case toNone = ""
    case toDismiss
}

protocol BaseViewModelOutput {

    var transition: Box<TransitionId> { get set }
    var loading: Box<Loading> { get set }
    var result: Box<Result<OperationId, Error>> { get set }
}

protocol BaseViewModelInput {
    
    func viewDidLoad()
    func viewDidAppear()
    func viewWillDisappear()
    func didSelectBack()
    func didSelectClose()
}

protocol BaseViewModelProtocol: BaseViewModelOutput, BaseViewModelInput {
 
    var analytics: AnalyticsProtocol? { get set }
    var cancellables: [Cancellable] { get set }
}

class BaseViewModel: BaseViewModelProtocol {

    var analytics: AnalyticsProtocol?
    var cancellables = [Cancellable]()
    var transition = Box(BaseViewModelTransition.toNone.rawValue)
    var loading: Box<Loading> = Box((operationId: 0, isLoading: false))
    var result: Box<Result<OperationId, Error>> = Box(.success(0))
    
    func viewDidLoad() {
        // Override in subclass
    }
    
    func viewDidAppear() {
        // Override in subclass
    }
    
    func viewWillDisappear() {
        cancellables.forEach { $0.cancel() }
    }
    
    func didSelectBack() {
        dismiss()
    }
    
    func didSelectClose() {
        dismiss()
    }
    
    func dismiss() {
        transition.value = BaseViewModelTransition.toDismiss.rawValue
    }
}
