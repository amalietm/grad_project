//
//  AddRunView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

import SwiftUI

// restrictions for input?


struct AddRunView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ToggleSwitch()
                        .padding(.bottom, 20)
                    
                    AddRunFormView()
                    HStack(spacing: 20) {
                        Button{} label: {
                            Text("Clear")
                        }
                            .buttonStyle(LightSquareButtonStyle())
                        Button{} label: {
                            Text("Add")
                        }
                            .buttonStyle(DarkSquareButtonStyle())
                    }
                }
            }
            .padding(.top)
            .navigationTitle("Add run")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.black)
                    }
                }

            }
            
        }
    }

}
    func clearInfo() {
        print("cleared")
    }
    func addInfo() {
        print("added")
//        savedNotesText = notesText
    }


struct AddRunView_Previews: PreviewProvider {
    static var previews: some View {
        AddRunView()
    }
}


    
    

