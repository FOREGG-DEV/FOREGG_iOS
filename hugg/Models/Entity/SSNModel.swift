//
//  SSN.swift
//  hugg
//
//  Created by Donghan Kim on 10/8/24.
//

import Foundation

struct SSNModel {
    var ssn1: String = ""
    var ssn2: String = ""
    var ssn3: String = ""
    var ssn4: String = ""
    var ssn5: String = ""
    var ssn6: String = ""
    var ssn7: String = ""

    // You can add validation logic or computed properties here
    var fullSSN: String {
        "\(ssn1)\(ssn2)\(ssn3)\(ssn4)\(ssn5)\(ssn6)\(ssn7)"
    }

    var isValid: Bool {
        // Simple validation check
        return fullSSN.count == 7 && fullSSN.allSatisfy { $0.isNumber }
    }
}
