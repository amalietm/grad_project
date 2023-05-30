//
//  WorkoutTime.swift
//  Grad_project
//
//  Created by Amalie Morch on 29/04/2023.
//

import SwiftUI

struct WorkoutTime: View {
    @State var selectedHour: Int = 0
    @State var selectedMinute: Int = 0
    
    var body: some View {
        HStack {
            Picker("hours", selection: self.$selectedHour) {
                ForEach(0 ..< 24) { number in
                    Text("\(selectedHour) h")
                }
            }
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
            
            Picker("minutes", selection: self.$selectedMinute) {
                ForEach(0 ..< 60) { number in
                    Text("\(selectedMinute) m")
                }
            }
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
        }
        .frame(width: 120).padding()
        
    }
}

struct WorkoutTime_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTime()
    }
}
