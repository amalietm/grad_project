//
//  WorkoutScroll.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

import SwiftUI


struct WorkoutScroll: View {
//    @AppStorage("WorkoutLiked") private var WorkoutLiked : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<3) { index in
//                            WorkoutScrollPost(workout_title: "Number 1", workout_description: "This is going to be a really quick tutorial because SwiftUI makes deleting a list item super simple. Step 1: Create data source.")
                            WorkoutScrollPost(miniWorkoutPostDataIndex: index)
                        }
                    }
                }
                .padding(.leading, 30)
                .frame(maxHeight: 400)
                
            }
        }
    }
}

extension UIScrollView {
  open override var clipsToBounds: Bool {
    get { false }
    set { }
  }
}


struct WorkoutScroll_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutScroll()
    }
}

// make a loop layout so i dont need to repeat myself three times
