//
//  SavedView.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

import SwiftUI

// replace filler with variables and data

struct SavedView: View {
//    @State private var workoutLiked : Bool = false
//    @Binding var workoutLiked: Bool
//    @State var displaySavedPosts: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                
                //            if workoutLiked == true {
                //                WorkoutScrollPost(workoutLiked: $workoutLiked, workout_title: "hello", workout_description: "hello")
                //            } else {
                //                self.workoutLiked.remove(WorkoutScrollPost())
                //            }
                //            WorkoutScrollPost(workoutLiked: $workoutLiked, workout_title: "dunno", workout_description: "dunno")
                
                ScrollView(){
                    ForEach(1..<4) { index in
                        SavedViewPost()
                    }
                }
                .padding(.top, 20)
                .navigationTitle("Saved")
                
            }
        }
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
