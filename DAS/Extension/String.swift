//
//  String.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 28/03/24.
//

import Foundation
extension String {
    func extractDateDetailsWithTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // Updated date string format
        
        guard let date = dateFormatter.date(from: self) else {
            return nil // Invalid date format
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
        
        if let day = components.day, let month = components.month, let dayNumber = components.weekday {
            let shortDayOfWeek = calendar.shortWeekdaySymbols[dayNumber - 1]
            let shortMonth = calendar.shortMonthSymbols[month - 1]
            return "\(shortDayOfWeek),  \(shortMonth) \(day)"
        } else {
            return nil // Error extracting date components
        }
    }
    func extractDateDetails() -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd" // Updated date string format
           
           guard let date = dateFormatter.date(from: self) else {
               return nil // Invalid date format
           }
           
           let calendar = Calendar.current
           let components = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
           
           if let day = components.day, let weekday = components.weekday, let month = components.month, let year = components.year {
               let shortDayOfWeek = calendar.shortWeekdaySymbols[weekday - 1]
               let shortMonth = calendar.shortMonthSymbols[month - 1]
               return "\(shortDayOfWeek), \(day) \(shortMonth) \(year)"
           } else {
               return nil // Error extracting date components
           }
       }}

