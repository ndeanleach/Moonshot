//
//  Mission.swift
//  Moonshot
//
//  Created by Nathan Leach on 9/29/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable { //nested struct for ease of viewing
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date? //JSONDecoder now recognizes as a date
    
    
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
