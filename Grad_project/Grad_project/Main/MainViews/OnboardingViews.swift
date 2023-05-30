//
//  OnboardingViews.swift
//  Grad_project
//
//  Created by Amalie Morch on 04/05/2023.
//

import SwiftUI

struct OnboardingViews: View {
    var body: some View {
        ZStack {
            Colors.purple
            TabView {
                firstOnboardingView
                Text("hello")
                Text("hello")
            }
            .tabViewStyle(.page)
                
        }
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
            bottomTabs
        }
    }
    
    var bottomTabs: some View {
        HStack {
            Spacer()
            Button {}
        label: {
            Image(systemName: "chevron.right")
                .padding(10)
                .padding(.horizontal, 5)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .tint(.black)
        }
        }
        .padding()
        .padding(.horizontal)
    }
    
    var firstOnboardingView: some View {
        VStack {
            VStack {
                Text("RUN")
                    .foregroundColor(Colors.blue)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.horizontal)
            .font(.system(size: 130, weight: .bold))
            Spacer()
            Text("Let's start running")
                .font(.largeTitle)
                .bold()
                .italic()
                .padding()
                .modifier(ShadowSolidModifier())
                .frame(width: 330)
//                .offset(y: -200)
            Spacer()
            
        }
    }
    


    
}


struct OnboardingViews_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViews()
    }
}
