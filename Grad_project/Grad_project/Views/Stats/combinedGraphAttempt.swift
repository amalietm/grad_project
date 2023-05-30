//
//  combinedGraphAttempt.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/05/2023.
//

import SwiftUI

// add data for streak

struct combinedGraphAttempt: View {

    @State var selectedTab = "Weekly"
    var tabs = ["Weekly", "Monthly"]
    
    @State private var selectedText = "Workouts"
    var textElements = ["Workouts", "Running distance"]
    
    var body: some View {
        VStack {
            
            SegementedPicker(selected: $selectedTab, options: tabs)
                .padding()
                
            combinedGraph2(selectedTab: $selectedTab,
                           bestStreak: 3,
                           data: workoutData[selectedTab]!)
            .padding()
            //                .animation(.easeOut(duration: 0.5), value: selectedTab)
            streakCircle(selectedTab: $selectedTab)
        }
    }
}

struct Daily: Identifiable, Equatable {
    var id : Int
    var day: String
    var workoutMin: CGFloat
}

var workoutData = [
    "Weekly" : [
        Daily(id: 0, day: "Week 1", workoutMin: 4),
        Daily(id: 1, day: "Week 2", workoutMin: 5),
        Daily(id: 2, day: "Week 3", workoutMin: 7),
        Daily(id: 3, day: "Week 4", workoutMin: 3),
        Daily(id: 4, day: "Week 5", workoutMin: 6),
        Daily(id: 5, day: "Week 6", workoutMin: 7),
        Daily(id: 6, day: "Week 7", workoutMin: 2),
        Daily(id: 7, day: "Week 8", workoutMin: 1)],
    "Monthly" : [
        Daily(id: 8, day: "Jan", workoutMin: 26),
        Daily(id: 9, day: "Feb", workoutMin: 32),
        Daily(id: 10, day: "Mar", workoutMin: 45),
        Daily(id: 11, day: "Apr", workoutMin: 12),
        Daily(id: 12, day: "May", workoutMin: 56),
//        Daily(id: 13, day: "June", workoutMin: 34),
//        Daily(id: 14, day: "July", workoutMin: 15),
//        Daily(id: 15, day: "Aug", workoutMin: 22),
//        Daily(id: 16, day: "Sep", workoutMin: 25),
//        Daily(id: 17, day: "Oct", workoutMin: 17),
//        Daily(id: 18, day: "Nov", workoutMin: 43),
//        Daily(id: 19, day: "Dec", workoutMin: 52)
    ]
]

struct combinedGraph2: View {
    @Binding var selectedTab: String
    @State var selected: Int?
    @State var bestStreak: CGFloat
    @State var showAlert = false
    @State private var previousTab: String = ""
    
    var data: [Daily]
    var colors = [Colors.purple, Colors.blue]
    
    
    
    
    
    
    var body: some View {
        // bar chart
        VStack(alignment: .leading, spacing: 25) {
        
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(data) { work in
                                // bars
                                VStack {
                                    VStack {
                                        Spacer(minLength: 0)
                                        
                                        if let graphText = getTextAboveGraph(work: work) {
                                                Text(graphText)
                                                    .foregroundColor(Colors.blue)
                                                    .bold()
                                                    .padding(.bottom, 5)
                                        }
                         
                                        RoundedRectangle(cornerRadius: 10)
                                                .fill(getBarColor(work: work))
                                                .frame(width: 30, height: getHeight(value: work.workoutMin))
                                        

                                    }
                                    .frame(height: 230)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            selected = work.id
                                        }
                                    }
                                    if selectedTab == "Monthly" {
                                        Text(work.day)
                                            .font(.caption)
                                            .foregroundColor(Colors.blue)
                                    }
                                }
                                .onAppear {

                                    scrollViewProxy.scrollTo(work.id, anchor: .trailing)
                                }
                                
                            }
                        }
                    }
                    .onChange(of: selectedTab, perform: { newValue in
                        if newValue != previousTab {
                            selected = nil
                            scrollViewProxy.scrollTo(data.last?.id, anchor: .trailing)
                        }
                        previousTab = newValue
                    })
                }
            
            Text(selectedTab == "Weekly" ? "Weeks" : "Months")
                .font(.title)
                .italic()
                .bold()
                .foregroundColor(Colors.purple)
            HStack {
                Text("Workouts")
                    .foregroundColor(.white)
                    .background(.black)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            
                    )
                Button{
                    showAlert = true
                } label: {
                    Text("Distance")
                        .foregroundColor(.gray)
    //                    .background(.white)
                        .padding(10)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
                
                .modifier(FeatureAlert(alertPresented: $showAlert))
            }
        }
        .padding()
        .cornerRadius(10)
        .padding()
        
//        HStack(spacing: 30) {
//            Spacer()
//
//            StatsCircleView(title: "Current", value: "🔥\(String(format: "%.0f", bestStreak))")
//
//
//            Spacer()
//            Spacer()
//
//            StatsCircleView(title: "Best", value: "👟\(String(format: "%.0f", highestValue))")
//
//            Spacer()
//        }
//        .font(.title)
//        .padding()
//        .padding(.vertical, 30)
//        .frame(maxHeight: 70)


    }
    
    func getHeight(value: CGFloat) -> CGFloat {
        guard let tabData = workoutData[selectedTab] else {
            return 0
        }
        
        let maxWorkoutMin = tabData.max(by: { $0.workoutMin < $1.workoutMin })?.workoutMin ?? 0
        let maxHeight: CGFloat = 200
        
        if maxWorkoutMin > 0 {
            let scaledHeight = (value / maxWorkoutMin) * maxHeight
            return min(scaledHeight, maxHeight)
        }
        
        return 0
    }
    
    func getBarColor(work: Daily) -> Color {
        if selected == work.id {
            return Colors.purple
        } else if work.id == data.last?.id && selected == nil {
            return Colors.purple
        } else {
            return Colors.blue
        }
    }
    
    func getTextAboveGraph(work: Daily) -> String? {
        if selected == work.id || (work.id == data.last?.id && selected == nil) {
            return String(format: "%.0f", work.workoutMin)
        } else {
            return nil
        }
    }

}

struct streakCircle: View {
    
    // streak
    @State private var streakData: [String] = []
    @State private var streakCounter: Int = 0
    @State private var streakTimer: Timer?
    @Binding var selectedTab: String
    
    var highestValue: CGFloat {
            guard let tabData = workoutData[selectedTab] else {
                return 0
            }
            return tabData.map { $0.workoutMin }.max() ?? 0
        }
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Current")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("🔥\(streakCounter)")
                        .bold()
                        .italic()
                }
                .overlay(
                    Circle()
                        .stroke(Colors.blue, lineWidth: 10)
                        .frame(width: 130, height: 130)
                )
                    
                
                Spacer()
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Best")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("👟\(String(format: "%.0f", highestValue))")
                        .bold()
                        .italic()
                }
                .overlay(
                    Circle()
                        .stroke(Colors.blue, lineWidth: 10)
                        .frame(width: 130, height: 130)
                )
                Spacer()
                
            }
            .font(.title)
            .padding()
            .padding(.vertical, 30)
            .frame(maxHeight: 70)
            
            Button(action: {
                self.appendData()
            }) {
                Text("Add")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            self.startTimer()
        }
        .onDisappear {
            self.stopTimer()
        }
    }
    func appendData() {
        streakData.append("New Data")
        streakCounter += 1
        resetTimer()
    }

    func resetTimer() {
        stopTimer()
        startTimer()
    }

    func startTimer() {
        streakTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            streakCounter = 0
        }
    }
    func stopTimer() {
        streakTimer?.invalidate()
        streakTimer = nil
    }
}

struct combinedGraphAttempt_Previews: PreviewProvider {
    static var previews: some View {
        combinedGraphAttempt()
    }
}



