//
//  InsideView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

import SwiftUI

// make notification when pressing "make your own"

struct InsideView: View {
    
    @State private var showAlert = false
    
    
    var body: some View {
//        NavigationStack {
            ScrollView {
                VStack(){
                    ChallengeView(challengeWorkoutPostDataIndex: 0)
                        .padding(.vertical)
                    WorkoutScroll()
                    Button {
                        showAlert = true
                    }
                    label: {
                        HStack {
                            Text("Make your own")
                                .font(Font.system(.title3))
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "plus")
                                .font(Font.system(.largeTitle))
                        }
                    }
                    .tint(.black)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .background(Rectangle()
                        .fill(Color(.white))
                        .shadow(
                            color: .black,
                            radius: CGFloat(0),
                            x: CGFloat(-7), y: CGFloat(7))
                    )
                    .border(.black)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    

                    .modifier(FeatureAlert(alertPresented: $showAlert))
                    
                }
                
            }
//        }
    }
}

struct InsideView_Previews: PreviewProvider {
    static var previews: some View {
        InsideView()
    }
}
