//
//  LoadingView.swift
//  Grad_project
//
//  Created by Amalie Morch on 30/04/2023.
//

import SwiftUI

// add beeps to countdown

struct LoadingView: View {
    @State var timeRemaining = 3
    @State private var showTimerView = false
    @State var showAlert: Bool = false
    @State var isActive = true
    
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    
    @Environment(\.presentationMode) var presentationMode
        
    // add delay
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("\(timeRemaining)")
                        .font(.system(size: 150, weight: .bold))
                        .italic()
                        .foregroundColor(fontColor)
                    
                }
            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {}
            .onReceive(timer) { time in
                guard isActive else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                
                if timeRemaining == 0 {
                    showTimerView = true
                    timer.upstream.connect().cancel()
                }
            }
            .navigationDestination(isPresented: $showTimerView) {
                TimerView(mainSelectedTab: .constant(2), backgroundColor: $backgroundColor, fontColor: $fontColor)

            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAlert.toggle()
                        isActive = false
                    } label: {
                        Image(systemName: "xmark")
                            .tint(fontColor)
                    }
                    .alert(isPresented: $showAlert, content: {
                        getAlert()
                    })
                }

            }
            
        }
        
    }
    func getAlert() -> Alert {
        return Alert(
            title: Text("This workout will not be saved if you choose to stop now."),
            message: Text("Do you wish to stop the workout?"),
            primaryButton: .destructive(Text("Stop")) {
                presentationMode.wrappedValue.dismiss()
            },
            secondaryButton: .cancel(Text("Cancel")){
                isActive = true
            }
        )
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(backgroundColor: .constant(.blue), fontColor: .constant(.white))
    }
}
