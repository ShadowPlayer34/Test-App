//
//  String+ext.swift
//  TestTask
//
//  Created by Andrew Hudik on 7/3/25.
//

import Foundation


extension String {

    /// Converts a date string from "yyyy-MM-dd" format to "dd MMMM" format.
    func formatToShortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd MMMM"
            return dateFormatter.string(from: date)
        }
        return ""
    }

    /// Converts a date string from "yyyy-MM-dd" format to "dd MMMM yyyy" format.
    func formatFullDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }

    /// Converts a date string from "yyyy-MM-dd" format to "MMMM, yyyy" format.
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMMM, yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}
