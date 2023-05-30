//
//  ToggleSwitch.swift
//  Grad_project
//
//  Created by Amalie Morch on 23/04/2023.
//

import SwiftUI

struct ToggleSwitch: View {
    @State private var isButtonPressedIn = true
    @State private var isButtonPressedOut = false
    var body: some View {
        ZStack{
            Capsule()
                .frame(width: 300, height: 40)
                .foregroundColor(.black)

            HStack{
                Button(action: {
                    self.isButtonPressedIn.toggle()
                    if isButtonPressedIn {
                        isButtonPressedOut = false
                    } else{
                        isButtonPressedIn = true
                    }
                }) {
                Capsule()
                .frame(width: 150, height: 40)
                .foregroundColor(isButtonPressedIn ? Color.white : Color.black)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(
                        Text("IN")
                            .foregroundColor(isButtonPressedIn ? Color.black : Color.white)
               )
                }
                
                
                Button(action: {
                    self.isButtonPressedOut.toggle()
                    if isButtonPressedOut {
                        isButtonPressedIn = false
                    } else{
                        isButtonPressedOut = true
                    }
                }) {
                Capsule()
                .frame(width: 150, height: 40)
                .foregroundColor(isButtonPressedOut ? Color.white : Color.black)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .overlay(
                        Text("OUT")
                            .foregroundColor(isButtonPressedOut ? Color.black : Color.white)
               )
                }
            }
            .fontWeight(.semibold)
            

        }
    }
}
    



struct ToggleSwitch_Previews: PreviewProvider {
    static var previews: some View {
        ToggleSwitch()
    }
}
