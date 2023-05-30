//
//  SelectedButtons.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

import SwiftUI

struct SelectedButtonsLevel: View {
    @State private var FillButtonLeft = true
    @State private var FillButtonMiddle = false
    @State private var FillButtonRight = false
    var body: some View {
        VStack(spacing: 30){
            HStack {
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "Beginner"
                )
                    
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonLeft = true
                    }
                }

                FillButton(
                    isSelected: $FillButtonMiddle,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextMiddle: "Moderate")
                .onTapGesture {
                    FillButtonMiddle.toggle()
                    if FillButtonMiddle {
                        FillButtonRight = false
                        FillButtonLeft = false
                    } else{
                        FillButtonMiddle = true
                    }
                }
                
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "Experienced")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonRight = true
                    }
                }
                
            }
        }
    }
}

struct SelectedButtonTwo: View {

    @State private var FillButtonLeft = true
    @State private var FillButtonRight = false
    var body: some View {
        VStack(spacing: 30){
            HStack {
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "Workouts"
                )
                    
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                    } else{
                        FillButtonLeft = true
                    }
                }

                
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "Distance")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                    } else{
                        FillButtonRight = true
                    }
                }

               Spacer()
                
            }
            .animation(.easeOut(duration: 0.3))
        }
    }
}

struct SelectedButtons: View {
    @State private var FillButtonLeft = true
    @State private var FillButtonMiddle = false
    @State private var FillButtonRight = false
    var body: some View {
        VStack(spacing: 30){
            HStack {
                FillButton(
                    isSelected: $FillButtonLeft,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextLeft: "yes"
                )
                    
                .onTapGesture {
                    FillButtonLeft.toggle()
                    if FillButtonLeft {
                        FillButtonRight = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonLeft = true
                    }
                }

                FillButton(
                    isSelected: $FillButtonMiddle,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextMiddle: "maybe")
                .onTapGesture {
                    FillButtonMiddle.toggle()
                    if FillButtonMiddle {
                        FillButtonRight = false
                        FillButtonLeft = false
                    } else{
                        FillButtonMiddle = true
                    }
                }
                
                FillButton(
                    isSelected: $FillButtonRight,
                    FillButtonColor: .black,
                    FillButtonColorText: .white,
                    FillButtonTextRight: "no")
                .onTapGesture {
                    FillButtonRight.toggle()
                    if FillButtonRight {
                        FillButtonLeft = false
                        FillButtonMiddle = false
                    } else{
                        FillButtonRight = true
                    }
                }
                
            }
        }
    }
}

struct SelectedButtons_Previews: PreviewProvider {
    static var previews: some View {
        SelectedButtonTwo()
    }
}
