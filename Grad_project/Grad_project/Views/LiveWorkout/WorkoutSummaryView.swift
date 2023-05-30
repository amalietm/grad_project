//
//  WorkoutSummaryView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

import SwiftUI

struct WorkoutSummaryView: View {
    @State private var notes: String = ""
    @Environment(\.dismiss) var dismiss
    var xmark: Image = Image(systemName: "xmark")
    @State var notesText: String = "Do you have any notes?"
    @State var savedNotesText: String = ""
    
    @State private var performance: Double = 2
    var userGoal: Double
    
    var body: some View {
        NavigationStack {
            
            VStack{
                Text("RUN")
                    .italic()
                    .font(.system(size: 80, weight: .bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Rectangle().frame(width: 200, height: 200)
                    VStack(spacing: 20) {
                        ForEach(1..<4) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("value")
                                    .fontWeight(.semibold)
                                Text("parameter")
                            }
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
                    .foregroundColor(.white)
                    .padding(20)
                    
                    HStack {
                        Slider(value: $performance, in: 0...userGoal, step: 1.0)
                            .disabled(true)
                            .colorMultiply(Color.blue)
                        //                        Text("Performance: \(Int(performance)) / \(Int(userGoal))")
                        //                        Capsule()
                        //                            .frame(height: 15)
                        //                            .foregroundColor(.white)
                        //                            .overlay(Capsule()
                        //                                .frame(width: 200, height: 15)
                        //                                .frame(maxWidth: .infinity, alignment: .leading)
                        //                                .foregroundColor(.blue))
                    }
                    .padding()
                }
                .frame(width: 320)
                .background(.black, in:RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 7)
                
                VStack(alignment: .leading){
                    Text("Notes")
                        .padding()
                        .font(.title2)
                        .fontWeight(.bold)
                    TextEditor(text: $notesText)
                        .frame(height: 100).cornerRadius(10)
                        .colorMultiply(Color("LightGrey"))
                        .padding([.bottom, .horizontal])
                    //                        .foregroundColor(Color("Orange"))
                }
                .padding(.top)
                .padding([.horizontal])
            }
            .foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StatisticsView(bestStreak: 6), label: {
                        Button {
//                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .tint(.black)
                            
                        }
                      
                    })
                    
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct WorkoutSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSummaryView(userGoal: 6)
    }
}
