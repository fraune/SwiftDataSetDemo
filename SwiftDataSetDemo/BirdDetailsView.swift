//
//  BirdDetailsView.swift
//  SwiftDataSetDemo
//
//  Created by Brandon Fraune on 4/2/24.
//

import SwiftUI
import SwiftData

struct BirdDetailsView: View {
    @Bindable var bird: Bird

    var body: some View {
        Form {
            Section("Nest") {
                List {
                    ForEach(Array(bird.eggs).sorted(by: { $0.ageWeeks < $1.ageWeeks })) { egg in
                        VStack(alignment: .leading) {
                            Text(egg.name)
                            Text("\(egg.ageWeeks) weeks old")
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button(action: addEgg) {
                    Label("Lay egg", systemImage: "plus")
                }
            }
        }
    }

    func addEgg() {
        withAnimation {
            let age = UInt.random(in: 0...40)
            let egg = Egg(ageWeeks: age)
            bird.eggs.lay(egg)
        }
    }
}
