//
//  SavedViewPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

import SwiftUI

struct SavedViewPost: View {
    var body: some View {
        VStack{
            HStack {
                HStack{
                    Text("RUN")
                        .padding(.horizontal)
                    Text("(IN)")
                        .italic()
                        .padding(.horizontal)
                }
                .frame(minWidth: 140)
                .fontWeight(.semibold)
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)

                .frame(maxWidth: .infinity, alignment: .leading)
                
                    Image(systemName: "play.fill")
                    .font(.title2)
                    .padding(.trailing, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                    Image(systemName: "heart")
                    .font(.title2)
                    .padding()
            }
            .padding(.horizontal)
            .border(.black, width: 2)
         
            HStack{
                VStack(alignment: .leading)  {
                    Text("Interval")
                    Text("BPM")
                    Text("Time")
                }
                .padding()
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .trailing)  {
                    Text("4x4")
                    Text("142 - 195")
                    Text("47 MIN")
                }
                .padding()
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        
         .background(Rectangle()
             .fill(Color(.white))
             .shadow(
                 color: .black,
                 radius: CGFloat(0),
                 x: CGFloat(-7), y: CGFloat(7))
             )
             .border(.black)
             .padding(.bottom, 20)
             .padding(.horizontal, 30)
    }
}

struct SavedViewPost_Previews: PreviewProvider {
    static var previews: some View {
        SavedViewPost()
    }
}
