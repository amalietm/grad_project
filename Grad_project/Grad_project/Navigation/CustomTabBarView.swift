//
//  CustomTabBarView.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

// add click events for buttons

import SwiftUI

struct CustomTabBarView: View {
    @State var selectedIndex = 0
    
    let icons = [
    "figure.run",
    "chart.bar.fill",
    "plus.circle.fill",
    "list.clipboard",
    "heart.fill"]

    var body: some View {
        VStack {
                switch selectedIndex {
                case 0:
                    HomeView()
                    
                case 1:
                    StatisticsView(bestStreak: 6)
                    
                case 2:
                    WorkoutOverviewView()
                    
                case 3:
                    WorkoutsView()
                    
                default:
                    SavedView()
                }
                HStack {
                    ForEach(0..<5, id: \.self) { number in
                        Spacer()
                        Button(action: {
                            self.selectedIndex = number
                        }, label: {
                            
                            if number == 2 {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(
                                        size: 55,
                                        weight: .thin,
                                        design: .default))
                                    .foregroundColor(Colors.blue)
                                
                            } else {
                                Image(systemName: icons[number])
                                    .font(.title2)
                                    .foregroundColor(selectedIndex == number ? .black : .gray)
                                    .scaleEffect(selectedIndex == number ? 1.25 : 1.0)
                                    .onTapGesture {
                                        withAnimation(.easeIn(duration: 0.1)) {
                                            selectedIndex = number
                                        }
                                    }
                            }
                        })
                        
                    }
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.gray, lineWidth: 1)
                )
            
//                .background(.ultraThinMaterial)
//                .cornerRadius(30)
                .padding([.bottom, .horizontal])
                
            }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
