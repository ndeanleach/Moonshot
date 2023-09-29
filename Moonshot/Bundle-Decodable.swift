//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Nathan Leach on 9/29/23.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T { //<T> = unknown type generic conforms to codable protocol
        
        //get url
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //get contentsOf: url
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter() //read in dates with this format
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter) //may want to add time zone
        
        //decode JSON data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
