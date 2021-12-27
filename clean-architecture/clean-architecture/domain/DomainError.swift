//
//  DomainError.swift
//  clean-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

// Declares errors related to business logic
enum DomainError {
    
    case UserAlreadyExistsError
    case UserIsNot18Error
    case UserHasNoFoundsError
}
