//
//  WorkoutPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

import SwiftUI

struct WorkoutPost: View {
    @State private var notes: String = ""
    @State private var goal: String = ""
    @State var notesText: String = "Do you have any notes?"
    @State var savedNotesText: String = ""
    
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Text("RUN")
                    Text("(IN)")
                        .italic()
                }
                .padding([.horizontal])
                Divider()
                    .frame(width:2, height: 70)
                    .overlay(.black)
                Text("Mon, Mar 6")
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
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
            Divider().frame(height: 2).overlay(.black)
            
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notesText)
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Color("LightGrey"))
                    .padding([.bottom, .horizontal])
                    .foregroundColor(Color("Orange"))
//
//                    .multilineTextAlignment(.leading)
//                    .frame(maxHeight: .infinity, alignment: .topLeading)
            }
            .padding([.horizontal])
//            .border(.black, width: 2)
            Divider().frame(height: 2).overlay(.black)
            
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                Text("6.2")
                    .fontWeight(.bold)
                Text("KM")
                    .padding()
                Image(systemName: "checkmark.circle.fill")
                    .font(Font.system(.title))
            }
            .padding([.horizontal])
        }
        .background(Rectangle()
            .fill(Color(.white))
            .shadow(
                color: .black,
                radius: CGFloat(0),
                x: CGFloat(-7), y: CGFloat(7))
        )
        .border(.black)
        .padding([.horizontal])
        .padding([.bottom], 30)
    }
}

struct WorkoutPost_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPost()
    }
}
