//
//  WelcomeDI.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

extension DependencyInjector {
    
    func injectWelcome(viewController: WelcomeViewController) {
        
        let analytics = DefaultAnalytics()
        let networkRepository = NetworkRepository()
        let fooUseCase = DefaultFooUseCase(network: networkRepository)
        let viewModel = DefaultWelcomeViewModel(fooUseCase: fooUseCase, analytics: analytics)
        viewModel.analytics = DefaultAnalytics()

        viewController.viewModel = viewModel
        viewController.analytics = DefaultAnalytics()
        viewController.navigationFlow = self
    }
}
