//
//  HelperExtensions.swift
//  SwiftDataSetDemo
//
//  Created by Brandon Fraune on 4/2/24.
//

import Foundation

extension Array<Egg> {
    mutating func lay(_ egg: Egg) {
        self.append(egg)
    }
}

extension Set<Egg> {
    mutating func lay(_ egg: Egg) {
        self.insert(egg)
    }
}
