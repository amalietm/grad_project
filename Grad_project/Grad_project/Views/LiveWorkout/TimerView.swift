//
//  TimerView.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

import SwiftUI
// components to play sounds and videos

struct TimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var pause = false
    @State var minutes: Int = 00
    @State var seconds: Int = 00
    @State var description: String = "Seconds"
    @Environment(\.scenePhase) var scenePhase
    @State var isActive = true
    
    @State private var showSummary = false
    @State var isAnimating: Bool = false
    
    @State var showAlert: Bool = false
    @Binding var mainSelectedTab: Int
    
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    
    var body: some View {
        NavigationStack {
            ZStack{
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("\(minutes, specifier: "%02d"):\(seconds, specifier: "%02d")")
                        .onReceive(timer) { _ in
                            guard isActive else { return }
                            if (pause == false){
                                self.seconds = self.seconds + 1
                                if self.seconds == 59 {
                                    self.seconds = 00
                                    self.minutes = self.minutes + 1
                                    description = "Minutes"
                                }
                            }
                        }
                        .font(.system(size: 80, weight: .bold))
                        Text(description)
                            .font(.system(size: 40, weight: .bold))
                            .onChange(of: scenePhase) { newPhase in
                                if newPhase == .active {
                                    isActive = true
                                } else {
                                    isActive = false
                                }
                            }
                }
                
                if pause  {
                    pauseScreen
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        .animation(.easeIn(duration: 0.2))
                }
                else {
                    playScreen
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                        .animation(.easeIn(duration: 0.2))
                }
            }
            .toolbar(.hidden)
            .foregroundColor(fontColor)
        }
    }
    
    var pauseScreen: some View {
        NavigationStack {
            VStack {
                ZStack{
                    Text("RUN")
                        .italic()
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .topLeading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 80, weight: .bold))
                }
                
                HStack {
                    Button {
                        pause.toggle()
                    } label: {
                        Image(systemName: "play.circle.fill")
                        Spacer()
                    }
                    .font(.system(size: 80, weight: .regular))
                    
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "stop.circle.fill")
                            .font(.system(size: 80, weight: .regular))
                    }
                    .alert(isPresented: $showAlert, content: {
                        getAlert()
                    })
//                    .navigationDestination(isPresented: $showSummary) {
//                        StatisticsView(showSummary:  $showSummary)
////                        mainSelectedTab = 2
//
//                    }
                    .fullScreenCover(isPresented: $showSummary, content: {
                        // do not add conditional logic
                        WorkoutSummaryView(userGoal: 4)
                    })

                    
                }
                .tint(.black)
                .padding(.horizontal, 40)
                
            }
            .toolbar(.hidden)
        }
    }
    
    func getAlert() -> Alert {
        return Alert(
            title: Text("You are stopping an ongoing workout."),
            message: Text("Do you wish to stop?"),
            primaryButton: .destructive(Text("Finish"), action: {
                showSummary = true
            }),
            secondaryButton: .cancel(Text("Cancel"), action: {
                pause.toggle()
            }))
    }
    
    var playScreen: some View {
        NavigationStack {
            VStack{
                HStack {
                    VStack(spacing: 20) {
                        Text("value")
                            .fontWeight(.semibold)
                        Text("BPM")
                    }
                    Spacer()
                    VStack(spacing: 20)  {
                        Text("value")
                            .fontWeight(.semibold)
                        Text("Distance")
                    }
                    Spacer()
                    VStack(spacing: 20)  {
                        Text("RUN")
                            .italic()
                            .fontWeight(.bold)
                        Text("value")
                            .opacity(0)
                    }
                }
                .font(.system(size: 25, weight: .regular))
                .padding(.vertical)
                .padding(.horizontal, 30)
                
                //                SyncedView()
                Spacer()
                Button{
                    pause.toggle()
                    
                } label: {
                    Image(systemName: "pause.circle.fill")
                        .font(.system(size: 80, weight: .regular))
                        .tint(.black)
                }
                
                
                
            }
            .toolbar(.hidden)
        }
        }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(description: "Seconds", mainSelectedTab: .constant(2), backgroundColor: .constant(.white), fontColor: .constant(.blue))
    }
}
