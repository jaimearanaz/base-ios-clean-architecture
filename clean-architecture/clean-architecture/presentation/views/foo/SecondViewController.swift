//
//  SecondViewController.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import UIKit

class SecondViewController: BaseViewController {
    
    var viewModel: SecondViewModel? {
        didSet { baseViewModel = viewModel }
    }
    var navigationFlow: WelcomeNavigationFlow?
}
