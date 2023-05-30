//
//  WorkoutOverviewView.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

import SwiftUI

// fix so toggle button is set, cant be changed, depending on workout


struct WorkoutOverviewView: View {
    @State private var showSettings : Bool = false
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("")
                .navigationTitle("Workout")
//                .navigationBarBackButtonHidden(true)
                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button {
//                            dismiss()
//                        } label: {
//                            Image(systemName: "arrow.left")
//                        }
//                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape")

                        }
                    }
                }
                .tint(.black)
                .fullScreenCover(isPresented: $showSettings, content: {
                    // do not add conditional logic
                    SettingsView()
                })
                ScrollView {
                    
                    VStack {
                        ToggleSwitch()
                            .padding(.vertical)
                        WorkoutOverviewPost()
                        SyncedView(buttonState: .spotify)
                            .padding(.vertical)
                        StartRunningButton()
                    }
                }
                
            }
             
        }
    }
}

struct WorkoutOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverviewView()
    }
}



