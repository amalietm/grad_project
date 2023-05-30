//
//  StartRunningButton.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//

import SwiftUI

struct StartRunningButton: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: LoadingView(backgroundColor: .constant(.white), fontColor: .constant(.blue)), label: {
                HStack {
                    Text("Start running")
                        .font(Font.system(.title3))
                        .fontWeight(.bold)
                    Spacer()
                    Divider()
                    //                    .frame(width:2, height: 45)
                    //                    .overlay(.black)
                    Image(systemName: "play.fill")
                        .padding()
                        .font(Font.system(.largeTitle))
                }
                .frame(height: 60)
                .padding([.horizontal])
                .background(Rectangle()
                    .fill(Color(.white))
                    .shadow(
                        color: .black,
                        radius: CGFloat(0),
                        x: CGFloat(-7), y: CGFloat(7))
                )
                .tint(.black)
                .border(.black)
                .padding([.horizontal], 30)
            })
        }
    }
}

struct StartRunningButton_Previews: PreviewProvider {
    static var previews: some View {
        StartRunningButton()
    }
}
