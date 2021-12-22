//
//  WelcomeViewController.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

class WelcomeViewController: BaseViewController {
    
    var viewModel: WelcomeViewModel? {
        didSet { baseViewModel = viewModel }
    }
    var navigationFlow: WelcomeNavigationFlow?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel?.fooMethod()
    }
}
