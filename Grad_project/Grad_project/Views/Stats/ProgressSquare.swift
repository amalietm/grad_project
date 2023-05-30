//
//  ProgressSquare.swift
//  Grad_project
//
//  Created by Amalie Morch on 26/04/2023.
//

import SwiftUI

struct ProgressSquare: View {
    var body: some View {
        HStack {
            Text("12 KM")
                .font(Font.system(.title3))
                .fontWeight(.semibold)
                .padding(10)
            Divider().frame(width: 2).overlay(.black)
            Text("322 MIN")
                .font(Font.system(.title3))
                .fontWeight(.semibold)
                .padding(10)
            Divider().frame(width: 2).overlay(.black)
            Text("22 RUNS")
                .font(Font.system(.title3))
                .fontWeight(.semibold)
                .padding(10)
        }
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black).frame(height: 60)
        .padding([.horizontal], 30)
        .padding([.top], 20)
    }
}

struct ProgressSquare_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSquare()
    }
}
