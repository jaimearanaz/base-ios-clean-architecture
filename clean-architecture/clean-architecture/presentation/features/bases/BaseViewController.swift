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
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    var baseViewModel: BaseViewModel?
    var analytics: AnalyticsProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        assertViewModel()
        baseViewModel?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        assertViewModel()
        baseViewModel?.viewDidAppear()
    }
    
    private func assertViewModel() {
        
        assert(baseViewModel != nil, "base view model must be set in base view controller")
    }
}
