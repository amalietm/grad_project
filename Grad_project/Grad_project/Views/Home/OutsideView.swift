//
//  OutsideView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

import SwiftUI

struct OutsideView: View {
    @State var showAlert = false
    @Environment(\.dismiss) private var dismiss
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Yet to come.")
                    .font(.system(size: 80, weight: .bold))
                    .italic()
                    .padding(.horizontal)
                    .padding(.bottom, 70)
                    .onAppear {
                        self.showAlert = true
                    }
                    .alert("This feature is yet to come", isPresented: $showAlert, actions: {
                            Button("OK", role: .cancel) {
                                tabIndex = 0
                            }
                        })
                
                
            }
            
        }
    }
}


//struct OutsideView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutsideView(shouldSwitchToInsideTab: .constant(false))
//    }
//}
