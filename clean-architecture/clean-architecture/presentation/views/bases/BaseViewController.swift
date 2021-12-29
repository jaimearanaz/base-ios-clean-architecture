//
//  BaseViewController.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    
    var analytics: AnalyticsProtocol? { get set }
    
    func localization()
    func customization()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
        
    var baseViewModel: BaseViewModel?
    var analytics: AnalyticsProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        localization()
        customization()
        assertViewModel()
        binds()
        baseViewModel?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        assertViewModel()
        baseViewModel?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        baseViewModel?.viewWillDisappear()
    }
    
    func localization() {
        // Override in subclass
    }
    
    func customization() {
        // Override in subclass
    }
    
    func handleSuccess(operationId: OperationId) {
        // Override in subclass
    }
    
    func handleError(_ error: Error) {
        // Override in subclass
    }
       
    func startLoading(operationId: OperationId) {
        // Override in subclass
    }
    
    func stopLoading(operationId: OperationId) {
        // Override in subclass
    }
    
    func binds() {

        baseViewModel?.loading.bindAndFire({ loading in
            
            switch loading.isLoading {
            case true:
                self.startLoading(operationId: loading.operationId)
            case false:
                self.stopLoading(operationId: loading.operationId)
                break
            }
        })
        
        baseViewModel?.result.bind({ result in
            
            switch result {
            
            case .success(let operationId):
                self.handleSuccess(operationId: operationId)
            case .failure(let error):
                self.handleError(error)
            }
        })
        
        baseViewModel?.transition.bind({ transition in
            
            switch transition {
            
            case BaseTransition.toNone.rawValue:
                break
            case BaseTransition.toDismiss.rawValue:
                self.dismiss(animated: true)
            default:
                self.performSegue(withIdentifier: transition, sender: self)
            }
        })
    }
    
    private func assertViewModel() {
        assert(baseViewModel != nil, "base view model must be set in base view controller")
    }
}
