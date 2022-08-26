//
//  String+decodeJSON.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

extension String {
    func decodeJSON<T>(_ type: T.Type) throws -> T where T: Decodable {
        var ret: T!
        do {
            if let data = self.data(using: .utf8) {
                ret = try JSONDecoder().decode(type, from: data)
            } else {
                throw NSError(domain: "Failure converting to UTF-8", code: 1)
            }
        } catch {
            throw error
        }
        return ret
    }
}
