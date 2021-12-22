//
//  WelcomeRouter.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

protocol WelcomeNavigationFlow {
    
    func injectOne(withSegue segue: UIStoryboardSegue)
}

extension WelcomeViewController {
    
    var oneSegue : String { get { return "oneSegue" } }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        switch (segue.identifier) {
        
        case oneSegue:
            navigationFlow?.injectOne(withSegue: segue)
            
        default:
            break
        }
    }
}
