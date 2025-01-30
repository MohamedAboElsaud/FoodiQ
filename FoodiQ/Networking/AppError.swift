//
//  AppError.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 28/01/2025.
//

import Foundation

enum AppError: LocalizedError{
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self{
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "unknownError"
        case .invalidUrl:
            return "error not valid url link"
        case .serverError(let error):
            return error
        }
    }
}
