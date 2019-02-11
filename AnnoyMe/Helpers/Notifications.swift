//
//  Notifications.swift
//  AnnoyMe
//
//  Created by Sam King on 2/11/19.
//  Copyright © 2019 Sam King. All rights reserved.
//

import Foundation
import UserNotifications

class Notifications: NSObject {
    
    class func displayAnnoyingWhatsAppNotif(_ center: UNUserNotificationCenter) {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Hey We need attention!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Please don't close our app cause then we can't spam you :(", arguments: nil)
        content.sound = UNNotificationSound.default
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "AnnoyingWhatsAppNotif", content: content, trigger: trigger) // Schedule the notification.
        center.removePendingNotificationRequests(withIdentifiers: ["AnnoyingWhatsAppNotif"]) //remove extraneous reqs
        center.add(request) { (error : Error?) in
            if let theError = error {
                print("OUR ERROR :: \(theError)")
            }
        }
    }
    
}

