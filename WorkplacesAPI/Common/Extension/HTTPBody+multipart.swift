//
//  HTTPBody+multipart.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.05.2021.
//

import Apexy

public extension HTTPBody {
    /// Create HTTP body with multipart content type.
    ///
    /// - Parameters:
    ///   - data: HTTP body data.
    /// - Returns: HTTPBody.
    static func multipart(_ data: Data, boundary: String) -> HTTPBody {
        return HTTPBody(data: data, contentType: "multipart/form-data; boundary=\(boundary)")
    }
}
