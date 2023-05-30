//
//  HomeView.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//

import SwiftUI
import Combine

// fix segmented picker
struct HomeView: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State var showAddRun = false
    
    var body: some View {
        NavigationStack {
            VStack {
                UnderlineView()
                    .navigationTitle("Today's")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
