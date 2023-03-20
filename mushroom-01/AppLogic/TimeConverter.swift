//
//  TimeConverter.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 20/03/2023.
//

import Foundation

func formatDate(date: Date?) -> String {
    guard let date = date else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: date)
}

func formatTime(date: Date?) -> String {
    guard let date = date else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter.string(from: date)
}

