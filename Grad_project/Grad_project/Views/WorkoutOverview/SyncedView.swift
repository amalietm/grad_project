//
//  SyncedView.swift
//  Grad_project
//
//  Created by Amalie Morch on 20/04/2023.
//

import SwiftUI

struct SyncedView: View {
    var buttonState: buttonState
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(height: 80)
            .overlay (
                HStack {
                    Text("Synced to")
                        .font(Font.system(.title3))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    switch buttonState {
                                case .spotify:
                                    Image("spotify")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.6)
                                        .foregroundColor(.white)
                                case .apple:
                                    Image("appleMusic")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(1.2)
                                        .foregroundColor(.white)
                                case .none:
                                    Text("No icon selected")
                                        .font(.headline)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                }
                .padding(.horizontal)
            )
            .padding(.horizontal)

    }
}

struct SyncedView_Previews: PreviewProvider {
    static var previews: some View {
        SyncedView(buttonState: .apple)
    }
}
