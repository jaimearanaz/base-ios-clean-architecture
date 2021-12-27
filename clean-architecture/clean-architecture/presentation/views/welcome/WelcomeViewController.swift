//
//  WelcomeViewController.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation
import UIKit

class WelcomeViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var refreshButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var viewModel: WelcomeViewModel? {
        didSet { baseViewModel = viewModel }
    }
    var navigationFlow: WelcomeNavigationFlow?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel?.fooMethod()
    }

    override func localization() {
        
        super.localization()
        titleLabel.text = "welcome".localized
        nextButton.setTitle("next".localized, for: .normal)
    }
    
    override func customization() {
        
        super.customization()
        descriptionLabel.text = ""
        nextButton.isEnabled = false
    }
    
    override func binds() {
    
        super.binds()
        
        viewModel?.state.bind({ state in
            if (state == BaseViewModelState.success.rawValue) {
                self.handleSuccess()
            } else {
                self.handleError(error: state)
            }
        })
        
        viewModel?.foo.bindAndFire({ foo in
            self.descriptionLabel.text = foo.param1
        })
    }

    @IBAction func didSelectNext(_ sender: Any) {
            performSegue(withIdentifier: secondSegue, sender: self)
    }
    
    private func handleSuccess() {
        nextButton.isEnabled = true
    }
    
    private func handleError(error: Int) {
        
        if (error == BaseViewModelState.noInternet.rawValue) {
            self.descriptionLabel.text = "no_internet".localized
        } else {
            self.descriptionLabel.text = "error".localized
        }
    }
}
