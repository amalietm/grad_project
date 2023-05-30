//
//  ButtonViews.swift
//  Grad_project
//
//  Created by Amalie Morch on 03/05/2023.
//

import SwiftUI


struct Icons {
    static let xmark = Image(systemName: "xmark")
    static let checkmarkFill = Image(systemName: "checkmark.circle.fill")
    static let checkmark = Image(systemName: "checkmark.circle")
    static let plus = Image(systemName: "plus")
    static let arrowRight = Image(systemName: "arrow.right")
    static let arrowLeft = Image(systemName: "arrow.left")
    static let gear = Image(systemName: "gearshape")
    static let play = Image(systemName: "play.fill")
    static let playCircle = Image(systemName: "play.circle.fill")
    static let heart = Image(systemName: "heart")
    static let heartFill = Image(systemName: "heart.fill")
}

struct Colors {
    static let blue = Color("Blue")
    static let purple = Color("Purple")
    static let lightGrey =  Color("LightGrey")
    static let green = Color("Green")
    static let nude = Color("Nude")
}

struct ButtonViews: View {
    
    var body: some View {

      Text("hello")
    }
}
   
//struct CapsuleButtonToggle: View {
//    @State var capsuleToggleStyle: Bool = false
//    var capsuleButtonText: String
//    
//    var body: some View {
//        Button {
//            capsuleToggleStyle.toggle()
//        }
//        label: {
//            Text(capsuleButtonText)
//        }
//        .buttonStyle(DarkCapsuleButtonStyle())
//    
//        if !capsuleToggleStyle {
//            Button {
//                capsuleToggleStyle.toggle()
//            }
//            label: {
//                Text(capsuleButtonText)
//            }
//            .buttonStyle(LightCapsuleButtonStyle())
//        }
//    }
//}

struct LightSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding(.horizontal, 55)
            .padding(.vertical, 8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(Rectangle()
                .fill(Color(.white))
                .shadow(
                    color: configuration.isPressed ? .black : .clear,
                    radius: CGFloat(0),
                    x: CGFloat(-7), y: CGFloat(7))
                .border(.black)
            )
    }
}

struct DarkSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal, 55)
            .padding(.vertical, 8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(Rectangle()
                .fill(Color(.black))
                .shadow(
                    color: configuration.isPressed ? .black : .clear,
                    radius: CGFloat(0),
                    x: CGFloat(-7), y: CGFloat(7))
                    .border(.white)
            )
    }
}

struct LightCapsuleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(.black)
            .padding(10)
            .background(.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.black, lineWidth: 2)
                                    
                    )
            
    }
}

struct DarkCapsuleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .foregroundColor(.white)
        .padding(10)
        .background(.black)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white, lineWidth: 2)
                                
                )
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViews()
    }
}
