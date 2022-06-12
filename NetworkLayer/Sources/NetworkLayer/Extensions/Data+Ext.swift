//
//  File.swift
//  
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation

extension Data {
    var prettyString: String? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                return nil
            }
            return jsonString
        } catch {
            print("prettyString:error: \(error.localizedDescription)")
            return nil
        }
    }
}
