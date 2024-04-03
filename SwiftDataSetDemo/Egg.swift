import Foundation
import SwiftData
import SwiftUI

/// Two eggs can have identical names and ages. Only their `id` can be used to differentiate them.
@Model
class Egg: Codable, Hashable {
    var id: UUID
    var name: String
    var ageWeeks: UInt

    init(id: UUID = UUID(), name: String? = nil, ageWeeks: UInt = 0) {
        self.id = id
        self.name = name ?? Self.randomBirdName
        self.ageWeeks = ageWeeks
    }

    // MARK: - Start Codable conformance (required for Egg to be a member of a Set)
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case ageWeeks
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ageWeeks = try container.decode(UInt.self, forKey: .ageWeeks)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(ageWeeks, forKey: .ageWeeks)
    }
    // MARK: - End Codable conformance

    // MARK: - Start Hashable conformance (makes sure that each Egg is distinct based only on its `id`)
    static func == (lhs: Egg, rhs: Egg) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    // MARK: - End Hashable conformance

    static var randomBirdName: String {
        [
            "Fluffy",
            "Cheeky",
            "Nibbles",
            "Feathers",
            "Squawkers",
            "Chirpy",
            "Pecky",
            "Waddles",
            "Tweetie",
            "Puddles",
            "Quirky",
            "Whiskers",
            "Swoopy",
            "Snuggles",
            "Blinky",
            "Doodle",
            "Tweety",
            "Squeaky",
            "Fuzzy",
            "Squiggle",
            "Boing",
            "Sniffles",
            "Flapjack",
            "Wiggle",
            "Bubbles",
            "Giggles",
            "Squiggy",
            "Pipsqueak",
            "Zigzag",
            "Wobble"
        ].randomElement()!
    }
}
