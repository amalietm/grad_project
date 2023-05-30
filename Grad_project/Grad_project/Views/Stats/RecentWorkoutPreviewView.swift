//
//  RecentWorkoutPreviewView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

import SwiftUI

struct RecentWorkoutPreviewView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Recents")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal], 30)
                
                NavigationLink(destination: WorkoutsView(),
                               label:{
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .padding()
                        .padding(.horizontal)
                        .tint(.black)
                })
                
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text("IN")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding()
                    
                    
                    VStack(alignment: .leading){
                        Text("6 KM")
                        Text("54 MIN")
                    }
                    .fontWeight(.bold)
                    .padding([.trailing], 40)
                    .padding([.leading], 10)
                    
                    VStack(alignment: .leading){
                        Text("BPM")
                            .fontWeight(.bold)
                        Text("AVERAGE 145")
                            .font(.caption)
                        Text("MAX 182")
                            .font(.caption)
                    }
                    .padding([.top], 5)
                }
                
                
                HStack{
                    Text("Goal")
                        .fontWeight(.bold)
                    Spacer()
                    Text("4/6 KM")
                }
                .padding()
                .foregroundColor(.white)
                .background(Rectangle()
                    .fill(Color(.black))
                )
                
            }
            .border(.black)
            .padding([.horizontal], 40)
        }
    }
}

struct RecentWorkoutPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        RecentWorkoutPreviewView()
    }
}
