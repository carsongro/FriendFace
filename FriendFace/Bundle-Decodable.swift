//
//  Bundle-Decodable.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ url: String) -> T {
        guard let url = URL(string: url) else {
            fatalError("Failed to load URL")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode file from bundle")
        }
        return loaded
    }
}
