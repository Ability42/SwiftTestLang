//: Playground - noun: a place where people can play

import UIKit

let now = Date()
let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)


extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        if secondsAgo < 60 {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < 60*60 {
            return "\(secondsAgo / 60) minutes ago"
        } else if secondsAgo < 60*60*24 {
            return "\(secondsAgo / 60 / 60) hours ago"
        }
        
        return "\(secondsAgo / 60 / 60 / 24) days ago"
    }
}

pastDate.timeAgoDisplay()