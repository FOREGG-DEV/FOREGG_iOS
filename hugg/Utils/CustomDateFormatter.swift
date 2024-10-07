//
//  CustomDateFormatter.swift
//  hugg
//
//  Created by Donghan Kim on 10/8/24.
//

import Foundation

var yearMonthDayFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}
