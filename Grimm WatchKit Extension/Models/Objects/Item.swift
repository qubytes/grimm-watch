//
//  Item.swift
//  Grimm WatchKit Extension
//
//  Created by Tyler Goffinet on 11/21/17.
//  Copyright © 2017 Tyler Goffinet. All rights reserved.
//

import Foundation

class Item: Codable {
    /// Name of the item.
    ///
    /// This property is displayed to the user
    /// in the item interface.
    var name: String
    
    /// Health of the item.
    ///
    /// Ranges from 0 - 100. Health value will
    /// snap to nearest valid value in not in
    /// range.
    var health: Int {
        didSet(oldHealth) {
            if health < 0 {
                health = 0
            } else if health > 100 {
                health = 100
            }
        }
    }
    
    /// Contructs an `Item` instance.
    ///
    /// - Parameters:
    ///   - name: Name of the item
    ///   - health: Health of the item. Defaults
    ///             to 100. Ranges from 0 - 100.
    ///             Snaps to the nearest valid value
    ///             if not in range.
    init(_ name: String, health: Int = 100) {
        self.name = name
        self.health = health
    }
    
    /// Increases the health of the item.
    ///
    /// - Parameter amount: Amount by which to increase
    ///                     the health of the item.
    ///                     Can not over repair. Health
    ///                     value snaps to the nearest
    ///                     valid value if not between
    ///                     0 - 100.
    func repair(by amount: Int) {
        health += amount
    }
    
    /// Decreases the health of the item.
    ///
    /// - Parameter amount: Amount by which to decrease
    ///                     the health of the item.
    ///                     Can not over weaken. Health
    ///                     value snaps to the nearest
    ///                     valid value if not between
    ///                     0 - 100.
    func weaken(by amount: Int) {
        health -= amount
    }
}