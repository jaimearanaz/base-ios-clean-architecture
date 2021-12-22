//
//  BaseViewModel.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

protocol BaseViewModelOutput {
    
}

protocol BaseViewModelInput {
    
    func viewDidLoad()
    func viewDidAppear()
}

protocol BaseViewModelProtocol: BaseViewModelOutput, BaseViewModelInput {
 
    var analytics: AnalyticsProtocol? { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    
    var analytics: AnalyticsProtocol?
    
    func viewDidLoad() { }
    
    func viewDidAppear() { }
}
