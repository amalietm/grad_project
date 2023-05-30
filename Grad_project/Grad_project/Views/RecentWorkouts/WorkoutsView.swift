//
//  WorkoutsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//

import SwiftUI

// text field to have more lines visible
// text field to start at top

struct WorkoutsView: View {
    @State private var notes: String = ""
    @State private var goal: String = ""
    @State var showAddRun = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ForEach(1..<4) { index in
                    WorkoutPost()
                }
                
            }
            .padding(.top, 20)
            .navigationTitle("Recent runs")
//            .navigationBarBackButtonHidden(true)
            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "arrow.left")
//                    }
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddRun.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .fullScreenCover(isPresented: $showAddRun, content: {
                        // do not add conditional logic
                        AddRunView()
                    })
                }
                
            }
            .tint(.black)
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}


