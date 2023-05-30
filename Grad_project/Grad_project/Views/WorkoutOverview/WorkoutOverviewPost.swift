//
//  WorkoutOverviewPost.swift
//  Grad_project
//
//  Created by Amalie Morch on 27/04/2023.
//

import SwiftUI

struct WorkoutOverviewPost: View {
    
//    @State private var notes: String = ""
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
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            
            VStack(alignment: .leading){
                Text("Notebook")
                    .padding([.vertical])
                    .fontWeight(.bold)
                TextEditor(text: $notesText)
                    .frame(height: 250).cornerRadius(10)
                    .colorMultiply(Color("LightGrey"))
                    .padding([.bottom, .horizontal])
                    .foregroundColor(Colors.blue)

            }
            .padding([.horizontal])
            Divider()
                .frame(width:.infinity, height: 2)
                .overlay(.black)
            
            HStack{
                Text("Goal")
                    .fontWeight(.bold)
                Spacer()
                TextField("—", text: $goal)
                    .padding([.horizontal], 10)
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1))
                    .frame(maxWidth: 40)
                Text("KM")
                    .padding()
                Image(systemName: "checkmark.circle")
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
        .padding(.vertical)
    }
}

struct WorkoutOverviewPost_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverviewPost()
    }
}
