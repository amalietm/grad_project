//
//  ContentPosts.swift
//  Grad_project
//
//  Created by Amalie Morch on 02/05/2023.
//

import SwiftUI

struct ContentPosts: View {
    
    // summary variables
    @State private var notes: String = ""
    @Environment(\.dismiss) var dismiss
    @State var notesText: String = "Do you have any notes?"
    @State var savedNotesText: String = ""
    @State private var performance: Double = 3
    var userGoal: Double
    
    // mini workout variables
    @State var miniPostItems: [MiniWorkoutModel] = [
        MiniWorkoutModel(title: "Longer torture interval", interval: "4x4", time: "20", liked: false)]
    //    let item: MiniWorkoutModel
    @State var workoutLiked : Bool = false
    //    @Binding var workoutLiked : Bool
    
    // recent workout variables
    @State private var goal: String = ""

    // add run variables
    @State private var selectedEnvironment = "IN"
    @State private var dateOfWorkout: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate: Date = Date()
    @State private var interval: String = ""
    @State private var BPM: String = ""
    @State var selectedHour: Int = 0
    @State var selectedMinute: Int = 0
    
    @State private var selectedGoalValue = "KM"
    @State private var goalAchieved : Bool = false
    
    let environment = ["IN", "OUT"]
    let goalValue = ["Min", "KM", "Pace"]
    
    // toggle button variables
    @State private var isButtonPressedIn = true
    @State private var isButtonPressedOut = false
    var toggleButtonText : [String] = ["In", "Out"]
    
    @State var capsuleToggleStyle: Bool = false
    var capsuleButtonText: String = "helloooo"
    
    // mini workout model
//    var miniWorkoutPostData: [MiniWorkoutModel] = [
//        MiniWorkoutModel(title: "Slow death", interval: "1.5x10", time: "20", liked: false),
//        MiniWorkoutModel(title: "Only half bad", interval: "40x20x10", time: "10", liked: false),
//        MiniWorkoutModel(title: "Sweaty mess", interval: "4x4", time: "20", liked: false),
//    ]
//
//    @State var miniWorkoutPostDataIndex: Int = 0
    
    var body: some View {
        Button {}
    label: {
        Text("hello")
    }
    .padding(20)
    .background(.blue)
    .cornerRadius(10)
    .foregroundColor(.white)
    .modifier(ShadowOpacityModifier(opacityShadow: .blue))
        
        
//                miniWorkoutPost
        //        summaryPost
        //        recentPost
//                challengePost
//                addPost
        //        savedPost
        //        workoutPost
//        recentMiniPost
//        toggleButton
        
//        Button {
//            capsuleToggleStyle.toggle()
//        }
//        label: {
//            Text("variable")
//        }
//        .buttonStyle(DarkCapsuleButtonStyle())
//
//        if !capsuleToggleStyle {
//            Button {
//                capsuleToggleStyle.toggle()
//            }
//        label: {
//            Text("variable")
//        }
//        .buttonStyle(LightCapsuleButtonStyle())
//        }
    }
    
    var challengePost: some View {
        
        RoundedRectangle(cornerRadius: 20)
        .frame(maxHeight: 180)
        .foregroundColor(Colors.blue)
        .padding()
        .modifier(ShadowOpacityModifier(opacityShadow: Colors.blue))

        .overlay(
        HStack{
            VStack (alignment: .leading, spacing: 20){
                Text("Heading")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Colors.purple)
                    
                Text("descriptiondescription descriptiondescription description")
                    .frame(maxWidth: 160)
            }
            .padding(.leading)
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Text("Start ")
                    Icons.playCircle
                }
                .foregroundColor(Colors.blue)
                .padding(10)
                .padding(.horizontal, 10)
                .background(Colors.purple, in: RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.semibold)
                .padding([.trailing, .bottom])
            }
        }
            .foregroundColor(.white)
        .padding()
        )
        
    }
    
    var workoutPost: some View {
        VStack {
            HStack{
                HStack{
                    Text("RUN")
                    Text("(IN)")
                        .italic()
                }
                .padding([.horizontal])
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                Text("Mon, Mar 6")
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .border(.black, width: 2)
            
            HStack{
                VStack(alignment: .leading)  {
                    Text("Interval")
                    Text("BPM")
                    Text("Time")
                }
                .padding()
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .trailing)  {
                    Text("4x4")
                    Text("142 - 195")
                    Text("47 MIN")
                }
                .padding()
            }
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notesText)
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Colors.lightGrey)
                    .padding([.bottom, .horizontal])
                    .foregroundColor(.black)

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
                    .background(Colors.lightGrey.cornerRadius(10))
                    .frame(maxWidth: 80)
                    .padding(.vertical)
                    .foregroundColor(Colors.blue)
                Text("KM")
                    .padding()
                Icons.checkmark
                    .font(Font.system(.title))
            }
            .padding([.horizontal])
            
            
        }
        .foregroundColor(.blue)
        .modifier(ShadowSolidModifier())
        .padding([.horizontal])
        .padding(.vertical)
    }
    
    var savedPost: some View {
        VStack{
            HStack {
                HStack{
                    Text("RUN")
                        .padding(.horizontal)
                    Text("(IN)")
                        .italic()
                        .padding(.horizontal)
                }
                .frame(minWidth: 140)
                .fontWeight(.semibold)
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)

                .frame(maxWidth: .infinity, alignment: .leading)
                
                Icons.play
                    .font(.title2)
                    .padding(.trailing, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                Icons.heartFill
                    .font(.title2)
                    .padding()
            }
            .padding(.horizontal)
            .border(.black, width: 2)
         
            HStack{
                VStack(alignment: .leading)  {
                    Text("Interval")
                    Text("BPM")
                    Text("Time")
                }
                .padding()
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .trailing)  {
                    Text("4x4")
                    Text("142 - 195")
                    Text("47 MIN")
                }
                .padding()
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .foregroundColor(Colors.blue)
        .modifier(ShadowSolidModifier())
             .padding(.bottom, 20)
             .padding(.horizontal, 30)
    }
    
    var addPost: some View {
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
                    .tint(Colors.blue)
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
                        .background(Colors.lightGrey.cornerRadius(10))
                        .frame(maxWidth: 80)
                        .padding(.vertical)
                        .foregroundColor(Colors.blue)
                }
                HStack {
                    Text("BPM")
                        .padding(.vertical,12)
                    Spacer()
                    TextField("", text: $BPM)
                        .padding(10)
                        .background(Colors.lightGrey.cornerRadius(10))
                        .frame(maxWidth: 80)
                    
                }
                HStack {
                    Text("Time")
//                        .padding(.vertical,12)
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
                    .tint(Colors.blue)
                        .colorInvert()
                                .colorMultiply(Colors.blue)
                }
            }
            .padding(.horizontal)
            .fontWeight(.semibold)
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
// remove text when user starts to type.
// save text when workout added
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notesText)
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Colors.lightGrey)
                    .padding(.bottom)
                    .foregroundColor(.black)
            }
            .padding([.horizontal])
            //            .border(.black, width: 2)
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                TextField("", text: $interval)
                    .padding(10)
                    .background(Colors.lightGrey.cornerRadius(10))
                    .frame(maxWidth: 80)
                    .padding(.vertical)
                    .foregroundColor(Colors.blue)
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
                        .foregroundColor(Colors.blue)
                        .frame(width: 30, height: 30)
                }
            }
            .padding([.horizontal])
        }
        .padding()
        .padding([.horizontal])
        .padding([.bottom], 30)
        .foregroundColor(Colors.blue)
    }
    
    var recentMiniPost: some View {
        VStack {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.white)
                .border(Colors.blue)
                .padding(.horizontal, 20)
                .overlay(
                    HStack(spacing: 15) {
                        Text("IN")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        Divider()
                            .frame(width: 1)
                            .overlay(Colors.blue)
                        VStack(alignment: .leading, spacing: 20) {
                            Text("6 KM")
                            Text("54 MIN")
                        }
                        .fontWeight(.semibold)
                        .padding()
                        Divider()
                            .frame(width: 1)
                            .overlay(Colors.blue)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("BPM")
                                .fontWeight(.semibold)
                            Text("Average 145")
                            Text("Max 181")
                        }
                        .padding()
                    })
                .foregroundColor(Colors.blue)
            Rectangle()
                .frame(height: 50)
                .foregroundColor(Colors.blue)
                .overlay(
                    HStack {
                        Text("Goal")
                        Spacer()
                        Text("4/6 KM")
                    }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                )
                .padding(.horizontal, 20)
        }
    }
    
    var recentPost: some View {
        VStack {
            HStack{
                HStack{
                    Text("RUN")
                    Text("(IN)")
                        .italic()
                }
                .padding([.horizontal])
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                Text("Mon, Mar 6")
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .border(.black, width: 2)
            
            HStack{
                VStack(alignment: .leading)  {
                    Text("Interval")
                    Text("BPM")
                    Text("Time")
                }
                .padding()
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .trailing)  {
                    Text("4x4")
                    Text("142 - 195")
                    Text("47 MIN")
                }
                .padding()
            }
            Divider().frame(height: 2).overlay(.black)
            
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Colors.lightGrey)
                    .frame(height: 300)
                    .padding()
                    .overlay(
                        Text("some notes")
                            .foregroundColor(.black)
                    )
            }
            .padding([.horizontal])
            Divider().frame(height: 2).overlay(.black)
            
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                Text("6.2")
                    .fontWeight(.bold)
                Text("KM")
                    .padding()
                Icons.checkmarkFill
                    .font(Font.system(.title))
            }
            .padding([.horizontal])
        }
        .foregroundColor(Colors.blue)
        .modifier(ShadowSolidModifier())
        .padding([.horizontal])
        .padding([.bottom], 30)
    }
    
    var summaryPost: some View {
        ZStack {
            Colors.blue
                .ignoresSafeArea()
            VStack{
                ZStack(alignment: .topTrailing) {
                    Button {
                        dismiss()
                    }
                label: {
                    Icons.xmark
                        .padding(.top, 20)
                    
                }
                }
                .foregroundColor(.white)
                .font(.title2)
                .tint(.black)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("RUN")
                    .italic()
                    .foregroundColor(Colors.purple)
                    .font(.system(size: 80, weight: .bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Rectangle().frame(width: 200, height: 200)
                        .foregroundColor(Colors.lightGrey)
                    VStack(spacing: 20) {
                        ForEach(1..<4) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("value")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Colors.purple)
                                Text("parameter")
                            }
                            .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                }
                
                VStack {
                    HStack {
                        Text("Goal for workout")
                        Spacer()
                        Text("\(Int(performance)) / \(Int(userGoal))")
                        Text("KM")
                    }
                    .font(Font.system(.title3))
                    .fontWeight(.bold)
                    .foregroundColor(Colors.blue)
                    .padding(20)
                    
                    HStack {
                        Slider(value: $performance, in: 0...userGoal, step: 1.0)
                            .disabled(true)
                            .colorMultiply(Colors.blue)
                    }
                    .padding()
                }
                .frame(width: 320)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Colors.purple)
                    .modifier(ShadowOpacityModifier(opacityShadow: .black))
                    )
                
                
                VStack(alignment: .leading){
                    Text("Notes")
                        .padding()
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Colors.purple)
                    TextEditor(text: $notesText)
                        .frame(height: 100).cornerRadius(10)
                        .colorMultiply(Colors.lightGrey)
                        .padding([.bottom, .horizontal])
                    //                        .foregroundColor(Color("Orange"))
                }
                .padding(.top)
                .padding([.horizontal])
            }
        }
        }
  
    // improve code
    var toggleButton: some View {
        ZStack{
            Capsule()
                .frame(width: 300, height: 40)
                .foregroundColor(.black)

            HStack{
                Button(action: {
                    self.isButtonPressedIn.toggle()
                    if isButtonPressedIn {
                        isButtonPressedOut = false
                    } else{
                        isButtonPressedIn = true
                    }
                }) {
                Capsule()
                .frame(width: 150, height: 40)
                .foregroundColor(isButtonPressedIn ? Color.white : Color.black)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(
                    Text(toggleButtonText[0]).textCase(.uppercase)
                            .foregroundColor(isButtonPressedIn ? Color.black : Color.white)
               )
                }
                
                
                Button(action: {
                    self.isButtonPressedOut.toggle()
                    if isButtonPressedOut {
                        isButtonPressedIn = false
                    } else{
                        isButtonPressedOut = true
                    }
                }) {
                Capsule()
                .frame(width: 150, height: 40)
                .foregroundColor(isButtonPressedOut ? Color.white : Color.black)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .overlay(
                    Text(toggleButtonText[1]).textCase(.uppercase)
                            .foregroundColor(isButtonPressedOut ? Color.black : Color.white)
               )
                }
            }
            .fontWeight(.semibold)
            

        }
    }
}

struct ShadowOpacityModifier: ViewModifier {
    
    var opacityShadow : Color
    func body(content: Content) -> some View {
        content
            .shadow(color: opacityShadow.opacity(0.6), radius: 7, x: -3, y: 4)
    }
}

struct ShadowSolidModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black)
    }
}

struct FeatureAlert: ViewModifier {
    @Binding var alertPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .alert("This feature is yet to come", isPresented: $alertPresented) {
                Button("OK", role: .cancel) { }
            }
    }
}





struct MiniWorkout_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentPosts(userGoal: 4, capsuleButtonText: "hellooo")
        }
    }
}

