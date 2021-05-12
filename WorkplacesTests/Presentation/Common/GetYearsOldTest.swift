//
//  GetYearsOldTest.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 07.05.2021.
//

@testable import Workplaces
import XCTest

final class GetYearsOldTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var formatter: DateFormatter!
    private var stubCurrentDate: Date!
    
    // MARK: - SetUp
    
    override func setUp() {
        super.setUp()
        
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        stubCurrentDate = formatter.date(from: "2021/05/10 10:10")
    }
    
    // MARK: - Tests
    
    func testExactBirthdayDate() throws {
        let date = formatter.date(from: "2017/05/10 10:10")!
        
        XCTAssertEqual(date.getNumberOfYears(from: stubCurrentDate), 4)
    }
    
    func testSomeYearsMinusOneMinute() throws {
        let date = formatter.date(from: "2017/05/10 10:11")!
        
        XCTAssertEqual(date.getNumberOfYears(from: stubCurrentDate), 3)
    }
    
    func testSomeYearsMinusOneDay() throws {
        let date = formatter.date(from: "2017/05/11 10:10")!
        
        XCTAssertEqual(date.getNumberOfYears(from: stubCurrentDate), 3)
    }
    
    func testNotPositiveCount() throws {
        let date = formatter.date(from: "2022/05/10 10:10")!
    
        XCTAssertEqual(date.getNumberOfYears(from: stubCurrentDate), -1)
    }

}
