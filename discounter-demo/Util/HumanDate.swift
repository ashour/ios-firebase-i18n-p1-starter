//
//  HumanDate.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-03.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Foundation

func humanizeDate(date: Date?) -> String
{
    if let date = date
    {
        let calendar = Calendar.current
        
        let now = Date()
        
        if calendar.isDateInToday(date)
        {
            return "today"
        }
        else if calendar.isDateInTomorrow(date)
        {
            return "tomorrow"
        }
        else if calendar.compare(
            date,
            to: now,
            toGranularity: .year) == .orderedDescending
        {
            let fullDateFormatter = DateFormatter()
            
            fullDateFormatter.dateFormat = "MMM d yyyy"
            
            return fullDateFormatter.string(from: date)
        }
        else if calendar.compare(
            date,
            to: now,
            toGranularity: .weekOfYear) == .orderedSame
        {
            let dayOfWeekFormatter = DateFormatter()
            
            dayOfWeekFormatter.dateFormat = "EEEE"
            
            return dayOfWeekFormatter.string(from: date)
        }
        else if calendar.compare(
            date,
            to: now,
            toGranularity: .year) == .orderedSame
        {
            let monthAndDayFormatter = DateFormatter()
            
            monthAndDayFormatter.dateFormat = "MMM d"
            
            return monthAndDayFormatter.string(from: date)
        }
    }
    
    return ""
}
