//
//  Date+getYears.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

extension Date {
    func getYearsOld() -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self, to: Date())
        let year = components.year
        return year
    }
}
