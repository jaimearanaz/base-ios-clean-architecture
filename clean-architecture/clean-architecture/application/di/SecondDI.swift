//
//  SecondDI.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import UIKit

extension DependencyInjector {
    
    func injectSecond(withSegue segue: UIStoryboardSegue) {
        
        let analytics = DefaultAnalytics()
        let networkRepository = NetworkRepository()
        let fooUseCase = DefaultFooUseCase(network: networkRepository)
        let viewModel = DefaultSecondViewModel(fooUseCase: fooUseCase, analytics: analytics)
        viewModel.analytics = DefaultAnalytics()

        let viewController = segue.destination as! SecondViewController
        viewController.viewModel = viewModel
        viewController.analytics = DefaultAnalytics()
        viewController.navigationFlow = self
    }
}
