//
//  AppError.swift
//  clean-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation

// Declares errors to share between Data layer and Presentation layer
// These errors are not related to business logic, that are declared in Domain layer
enum AppError: Error {
    
    case NoConnectionError
    case TimeoutError
    case HttpNotFoundError
    case DatabaseError
    case PasswordError
}
