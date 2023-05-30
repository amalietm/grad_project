//
//  WorkoutScrollPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

import SwiftUI

struct WorkoutScrollPost: View {

    var miniWorkoutPostData: [MiniWorkoutModel] = [
        MiniWorkoutModel(title: "Slow death", interval: "1.5x10", time: "20", liked: false),
        MiniWorkoutModel(title: "Only half bad", interval: "40x20x10", time: "10", liked: false),
        MiniWorkoutModel(title: "Sweaty mess", interval: "4x4", time: "20", liked: false),
    ]
    
    // fix so this corresponds to bool value in model
    @State var workoutLiked : Bool = false
    @State var miniWorkoutPostDataIndex: Int
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Colors.purple)
            .frame(width: 200, height: 230)
            .modifier(ShadowOpacityModifier(opacityShadow: .gray))
        
            .overlay(
                VStack {
                    VStack {
                        HStack {
                            Text(miniWorkoutPostData.indices.contains(miniWorkoutPostDataIndex) ? miniWorkoutPostData[miniWorkoutPostDataIndex].title : "")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.top)
                                .padding(.leading, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(width: 140, height: 80)
                            
                            Button(action: {
                                self.workoutLiked.toggle()
                            }) {
                                Image(systemName: workoutLiked ? "heart.fill" : "heart")
                                    .foregroundColor(Colors.blue)
                                    .font(.title2)
                                    .frame(width: 10)
                                    .padding(.trailing)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                        }
                        .padding(.horizontal)
                        HStack {
                            VStack(alignment:.leading , spacing: 10) {
                                Text("Interval")
                                    .textCase(.uppercase)
                                    .bold()
                                Text(miniWorkoutPostData.indices.contains(miniWorkoutPostDataIndex) ? miniWorkoutPostData[miniWorkoutPostDataIndex].interval : "")
                            }
                            Spacer()
                            VStack(alignment:.leading , spacing: 10) {
                                Text("Time")
                                    .bold()
                                    .textCase(.uppercase)
                                Text(miniWorkoutPostData.indices.contains(miniWorkoutPostDataIndex) ? "\(miniWorkoutPostData[miniWorkoutPostDataIndex].time) min" : "")
                            }
                               
                        }
                        .padding(.horizontal, 20)
                    }
                    .foregroundColor(Colors.blue)
                    
                    NavigationLink(destination: WorkoutOverviewView(),
                                   label:{
                        HStack{
                            Text("Start")
                                .fontWeight(.semibold)
                            Icons.play
                                .padding(10)
                        }.tint(.black)
                    })
                    
                    
                    .padding([.horizontal])
                    .modifier(ShadowSolidModifier())
                    .border(.black)
                    .padding(.bottom, 20)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    
                }
            ).padding(.trailing)
    }
}


struct WorkoutScrollPost_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutScrollPost(miniWorkoutPostDataIndex: 1)
    }
}
