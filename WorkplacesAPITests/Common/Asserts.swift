//
//  Asserts.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
import XCTest

func assertGET(_ urlRequest: URLRequest, file: StaticString = #file, line: UInt = #line) {
    guard let method = urlRequest.httpMethod else {
        return XCTFail("The request doesn't have HTTP method", file: file, line: line)
    }
    XCTAssertEqual(method, "GET", file: file, line: line)
    XCTAssertNil(urlRequest.httpBody, "GET request must not have body", file: file, line: line)
}

func assertPOST(_ urlRequest: URLRequest, file: StaticString = #file, line: UInt = #line) {
    guard let method = urlRequest.httpMethod else {
        return XCTFail("The request doesn't have HTTP method", file: file, line: line)
    }
    XCTAssertEqual(method, "POST", file: file, line: line)
}

func assertDELETE(_ urlRequest: URLRequest, file: StaticString = #file, line: UInt = #line) {
    guard let method = urlRequest.httpMethod else {
        return XCTFail("The request doesn't have HTTP method", file: file, line: line)
    }
    XCTAssertEqual(method, "DELETE", file: file, line: line)
}

func assertPATCH(_ urlRequest: URLRequest, file: StaticString = #file, line: UInt = #line) {
    guard let method = urlRequest.httpMethod else {
        return XCTFail("The request doesn't have HTTP method", file: file, line: line)
    }
    XCTAssertEqual(method, "PATCH", file: file, line: line)
}

func assertPath(_ urlRequest: URLRequest, _ path: String, file: StaticString = #file, line: UInt = #line) {
    guard let url = urlRequest.url else {
        return XCTFail("The request doesn't have URL", file: file, line: line)
    }
    XCTAssertEqual(url.path, path, "Request's path doesn't match", file: file, line: line)
}

func assertURL(_ urlRequest: URLRequest, _ urlString: String, file: StaticString = #file, line: UInt = #line) {
    guard let url = urlRequest.url else {
        return XCTFail("The request doesn't have URL", file: file, line: line)
    }
    XCTAssertEqual(url.absoluteString, urlString, "Request's URL doesn't match", file: file, line: line)
}

func assertHTTPHeaders(_ urlRequest: URLRequest, _ headers: [String: String], file: StaticString = #file) {
    XCTAssertEqual(urlRequest.allHTTPHeaderFields, headers)
}

func assertJsonBody(_ urlRequest: URLRequest, _ jsonBody: HTTPBody, file: StaticString = #file, line: UInt = #line) {
    guard let body = urlRequest.httpBody else {
        return XCTFail("The request doesn't have body", file: file, line: line)
    }

    if let contentType = urlRequest.value(forHTTPHeaderField: "Content-Type") {
        XCTAssertTrue(contentType.contains("application/json"), "Content-Type ???????????? ???? json")
    } else {
        XCTFail("The request doesn't have HTTP Header Content-Type", file: file, line: line)
    }
    
    XCTAssertEqual(body, jsonBody.data, file: file, line: line)
}
