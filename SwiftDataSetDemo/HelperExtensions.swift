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
