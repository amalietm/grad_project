//
//  ChallengeView.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

import SwiftUI

struct ChallengeView: View {

    var challengeWorkoutPostData: [ChallengeWorkoutModel] = [
        ChallengeWorkoutModel(title: "Pain", time: "10", description: "A lay-down-on-the-floor moment")
    ]
    
    @State var challengeWorkoutPostDataIndex: Int
    @State private var backgroundColor = Colors.blue
    @State private var fontColor = Color.white
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 20){
                HStack {
                    Text(challengeWorkoutPostData.indices.contains(challengeWorkoutPostDataIndex) ? challengeWorkoutPostData[challengeWorkoutPostDataIndex].title : "")
                    Spacer()
                    Text(challengeWorkoutPostData.indices.contains(challengeWorkoutPostDataIndex) ? "\(challengeWorkoutPostData[challengeWorkoutPostDataIndex].time) MIN" : "")
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Colors.purple)
                
                Text(challengeWorkoutPostData.indices.contains(challengeWorkoutPostDataIndex) ? challengeWorkoutPostData[challengeWorkoutPostDataIndex].description : "")
                .foregroundColor(.white)
                .font(.title3)
                
                Button {
    //                backgroundColor = Color.blue
    //                fontColor = Color.white
                }
                label: {
                    NavigationLink {
                        LoadingView(backgroundColor: $backgroundColor, fontColor: $fontColor)
                    } label: {
                        Text("Start ")
                        Icons.playCircle
                            .padding(10)
                    }

                }

                        .font(.title3)
                        .foregroundColor(Colors.blue)
                        .frame(maxWidth: .infinity)
                        .background(Colors.purple)
                        .cornerRadius(10)
                        .fontWeight(.semibold)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Colors.blue)
                .modifier(ShadowOpacityModifier(opacityShadow: Colors.blue))
            )
            Text("NEW")
                .font(.caption)
                .foregroundColor(.white)
//                .padding(.vertical, 10)
                .padding(20)
                .background(
                    Circle()
                        .foregroundColor(.black)
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: 10, y: -95)
            
        }
        
        .padding(.horizontal)
        
        
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(challengeWorkoutPostDataIndex: 0)
    }
}



            
    
