//
//  AddRunFormView.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//

import SwiftUI

struct AddRunFormView: View {
    
    @State private var selectedEnvironment = "IN"
    @State private var dateOfWorkout: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate: Date = Date()
    @State private var interval: String = ""
    @State private var BPM: String = ""
    @State var selectedHour: Int = 0
    @State var selectedMinute: Int = 0
    
    @State var notesText: String = "Do you have any notes?"
    @State var savedNotesText: String = ""
    
    @State private var goal: String = ""
    @State private var selectedGoalValue = "KM"
    @State private var goalAchieved : Bool = false
    
    let environment = ["IN", "OUT"]
    let goalValue = ["Min", "KM", "Pace"]

    
    
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Text("RUN")
                        .frame(width: 45)
                        .font(.title3)
                    Picker("", selection: $selectedEnvironment) {
                        ForEach(environment, id: \.self) {
                            Text($0)
                        }
                    }
                    .fontWeight(.none)
                    .italic()
                    .colorInvert()
                    .colorMultiply(Colors.blue)
                    .pickerStyle(.wheel)
                    .frame(width: 100, height: 80)
                }
                .padding(.horizontal)
                
                DatePicker("",
                           selection: $dateOfWorkout,
                           in: startingDate...endingDate,
                           displayedComponents: .date)
                    .padding()
                    .colorInvert()
                    .colorMultiply(Colors.blue)
            }
            .fontWeight(.bold)
        
            VStack(spacing: 20){
                HStack{
                    Text("Interval")
                        .padding(.vertical,12)
                    Spacer()
                    TextField("", text: $interval)
                        .padding(10)
                        .background(Color(.gray).opacity(0.2).cornerRadius(10))
                        .frame(maxWidth: 80)
                        .padding(.vertical)
                }
                HStack {
                    Text("BPM")
                        .padding(.vertical,12)
                    Spacer()
                    TextField("", text: $BPM)
                        .padding(10)
                        .background(Color(.gray).opacity(0.2).cornerRadius(10))
                        .frame(maxWidth: 80)
                    
                }
                HStack {
                    Text("Time")
                    Spacer()
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
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 120, height: 80)
                        .colorInvert()
                        .colorMultiply(Colors.blue)
                }
            }
            .padding(.horizontal)
            .fontWeight(.semibold)
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notesText)
                    .onTapGesture {
                        if notesText == "Do you have any notes?" {
                            notesText = ""
                        }
                    }
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Color("LightGrey"))
                    .padding(.bottom)
            }
            .padding([.horizontal])
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                TextField("", text: $interval)
                    .padding(10)
                    .background(Color(.gray).opacity(0.2).cornerRadius(10))
                    .frame(maxWidth: 80)
                    .padding(.vertical)
                Picker("", selection: $selectedGoalValue) {
                    ForEach(goalValue, id: \.self) {
                        Text($0)
                    }
                }
                .colorInvert()
                .colorMultiply(Colors.blue)
                .pickerStyle(.wheel)
                .frame(width: 70, height: 100)
                
                Button(action: {
                    self.goalAchieved.toggle()
                }) {
                    Image(systemName: self.goalAchieved == true ? "checkmark.circle.fill" : "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding([.horizontal])
        }
        .foregroundColor(Colors.blue)
        .padding()
        .padding([.horizontal])
        .padding([.bottom], 30)
    }
    
    func textIsAppropriate() -> Bool {
        if notesText.count >= 3 {
            return true
        }
        return false
    }
    
}

struct AddRunFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddRunFormView()
    }
}
