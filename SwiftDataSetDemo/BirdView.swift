//
//  ContentView.swift
//  SwiftDataSetDemo
//
//  Created by Brandon Fraune on 4/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Bird]

    var body: some View {
        NavigationSplitView {
            if items.count == 0 {
                Text("No birds. Hit the +")
            }
            List {
                ForEach(items) { bird in
                    NavigationLink {
                        List {
                            ForEach(bird.eggs) { egg in
                                VStack {
                                    Text(egg.name)
                                    Text("\(egg.ageWeeks)")
                                }
                            }
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            Text(bird.species)
                            Text("\(bird.eggs.count) eggs")
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Bird()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Bird.self, inMemory: true)
}
