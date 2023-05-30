//
//  Favorites.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
//
//class FavoriteWorkouts: ObservableObject {
//    var resorts: Set <String>
//    let saveKey = "Favorites"
//
//    init() {
//        // load saved data
//        resorts = []
//    }
//
//    func contains(_ resort: Resort) -> Bool {
//        resorts.contains(resort.id)
//    }
//    func add(_resort: Resort) {
//        objectWillChange.send()
//        resorts.insert(resort.id)
//        save()
//    }
//    func remove(_resort: Resort) {
//        objectWillChange.send()
//        resorts.remove(resort.id)
//        save()
//    }
//    func save() {
//
//    }
//}
