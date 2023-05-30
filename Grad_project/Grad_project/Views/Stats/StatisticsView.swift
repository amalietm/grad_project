//
//  StatisticsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 19/04/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @State var showRecents : Bool = false
    @State var showAddRun : Bool = false
//    @Binding var showSummary: Bool
    @State var currentStreak: Int = 0
    @State var bestStreak: Int
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView(){
                HStack() {
                    Text("Statistics")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        showAddRun.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .tint(.black)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .fullScreenCover(isPresented: $showAddRun, content: {
                    // do not add conditional logic
                    AddRunView()
                })
                
                VStack {
                    combinedGraphAttempt()
                    RecentWorkoutPreviewView()
                    ProgressSquare()

                }

                
            }
            //        ZStack {
            //        if showSummary {
            //            WorkoutSummaryView()
            //                .padding(.top, 50)
            //                .cornerRadius(10)
            //                .transition(.move(edge: .bottom))
            //                .animation(.spring())
            //        }
            //        }
            //                .zIndex(2.0)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(bestStreak: 6)
    }
}


