//
//  ErrorMessage.swift
//  SoftXpert
//
//  Created by John Doe on 2022-01-25.
//

import Foundation
enum ErrorMessage : String,Error {
    case InvalidData = "Sorry ,Something went wrong try agian."
    case InvalidRequest = "Sorry ,This url isn't good enough ,Try agian later."
    case InvalidResponse = " Server Error ,Modify your search and try agian."
}
