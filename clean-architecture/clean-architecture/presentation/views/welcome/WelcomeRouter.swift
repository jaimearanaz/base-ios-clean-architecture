//
//  WelcomeRouter.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

protocol WelcomeNavigationFlow {
    
    func injectSecond(withSegue segue: UIStoryboardSegue)
}

extension WelcomeViewController {
    
    var secondSegue : String { get { return "secondSegue" } }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        switch (segue.identifier) {
        
        case secondSegue:
            navigationFlow?.injectSecond(withSegue: segue)
            
        default:
            break
        }
    }
}
