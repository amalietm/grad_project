//
//  attempt2.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

import SwiftUI

struct attempt2: View {
    @State var endResult: Int = 2
//    @State var sliderValue: Double = 3
    @State private var performance: Double = 2
    var userGoal: Double
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 3
    var progessValue: Int = 0
    var timer: Timer? = nil
    var body: some View {
       
        VStack {
            Slider(value: $performance, in: 0...userGoal, step: 1.0)
            Text("Performance: \(Int(performance)) / \(Int(userGoal))")
        }
  

        

    }


}

struct attempt2_Previews: PreviewProvider {
    static var previews: some View {
        attempt2(userGoal: 4)
    }
}
