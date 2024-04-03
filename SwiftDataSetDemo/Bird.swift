//
//  Item.swift
//  SwiftDataSetDemo
//
//  Created by Brandon Fraune on 4/2/24.
//

import Foundation
import SwiftData

@Model
final class Bird {
    var id: UUID
    var species: String
    @Relationship(deleteRule: .cascade) var eggs = Set<Egg>() // CASE 1: Fails
//  @Relationship(deleteRule: .cascade) var eggs = [Egg]()    // CASE 2: Works
    
    init(id: UUID = UUID(), species: String? = nil) {
        self.id = id
        self.species = species ?? Self.randomBird
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case species
        case eggs
    }

    static var randomBird: String {
        [
            "House Sparrow",
            "European Robin",
            "American Robin",
            "Mallard Duck",
            "Pigeon",
            "Common Blackbird",
            "Eurasian Magpie",
            "Great Tit",
            "Blue Jay",
            "American Goldfinch",
            "Northern Cardinal",
            "Barn Owl",
            "Snowy Owl",
            "Osprey",
            "Bald Eagle",
            "Great Horned Owl",
            "European Starling",
            "Mourning Dove",
            "Common Wood Pigeon",
            "Rock Pigeon",
            "Northern Mockingbird",
            "Common Nightingale",
            "Red-winged Blackbird",
            "Eastern Bluebird",
            "Ruby-throated Hummingbird",
            "Canada Goose",
            "European Goldfinch",
            "House Finch",
            "American Crow",
            "Eurasian Collared Dove"
        ].randomElement()!
    }
}
