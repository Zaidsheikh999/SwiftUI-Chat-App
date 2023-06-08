//
//  Message.swift
//  ChatAppSwiftUI
//
//  Created by Zaid Sheikh on 06/06/2023.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var recieved: Bool
    var timestamp: Date
}

