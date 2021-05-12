//
//  Date+getNumberOfYears.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

extension Date {
    func getNumberOfYears(from date: Date = Date()) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self, to: date)
        let year = components.year
        return year
    }
}
