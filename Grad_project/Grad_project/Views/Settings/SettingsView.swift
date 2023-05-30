//
//  SettingsView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//

import SwiftUI

enum buttonState {
    case spotify
    case apple
    case none
}

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    @State private var isEmailValid = true
    
    @State private var measurement = "Metric"
    @State private var device = "Apple Watch"
    @State private var dataPermission = false
    @State private var showAlert = false
    
    @State private var buttonState: buttonState = .none
//    @State var isSelected: Bool = false
    
//    @State var buttonStates = Array(repeating: false, count: 2)
//    let buttonTitles = ["Spotify", "Apple Music"]
    

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    // make sure email input is an email
                    HStack {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .keyboardType(.emailAddress)
                        ZStack {
                            if !isEmailValid {
                                Text("Invalid email")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    // save this info
                    Section {
                        Text("Runner level")
                        SelectedButtonsLevel()
                            .padding(.vertical, 20)
                    }
                    // save this info
                    Toggle("Data permission", isOn: $dataPermission)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    // link to syncable screen
                    Section {
                        NavigationLink(destination: WatchSyncView()) {
                            HStack {
                                Text("Setup:")
                                Text(device)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: "applewatch")
                                    .font(.largeTitle)
                            }
                            
                        }
                        // link to workout overview icon
                        HStack(spacing: 20) {
                            Text("Sync to:")
                            Spacer()
//                            ForEach(buttonTitles.indices, id: \.self) { index in
//                                    Text(buttonTitles[index])
//                                        .foregroundColor(buttonStates[index] ? .black : .gray)
//                                        .onTapGesture {
//                                            selectButton(at: index)
//                                        }
//                                }
                            Button(action: {
                                buttonState = .spotify
                            }) {
                                Text("Spotify")
                                    .foregroundColor(buttonState == .spotify ? .black : .gray)
                            }
            
                            .onTapGesture {
                                if buttonState == .spotify {
                                    buttonState = .none
                                } else {
                                    buttonState = .spotify
                                    if buttonState == .apple {
                                        buttonState = .spotify
                                    }
                                }
                            }
                            Button(action: {
                                buttonState = .apple
                            }) {
                                Text("Apple Music")
                                    .foregroundColor(buttonState == .apple ? .black : .gray)
                            }
            
                            .onTapGesture {
                                if buttonState == .apple {
                                    buttonState = .none
                                } else {
                                    buttonState = .apple
                                    if buttonState == .spotify {
                                        buttonState = .apple
                                    }
                                }
                            }
                                
                        }
                    }
                    
                    Button {
                        showAlert = true
                    } label: {
                        Text("Terms of service")
                            .foregroundColor(Colors.blue)
                    }
                    .alert("Lucky you, there are no terms", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                }
                // clear choices & save choices
                HStack(spacing: 20) {
                    Button{} label: {
                        Text("Clear")
                    }
                    .buttonStyle(LightSquareButtonStyle())
                    Button{
                        validateEmail()
                        //                    saveSettings
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(DarkSquareButtonStyle())
                }
            }
            
            .navigationTitle("Settings")
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
    
//    func selectButton(at index: Int) {
//            buttonStates = buttonStates.enumerated().map { offset, _ in
//                offset == index
//            }
//        }
    
    func saveSettings() {

    }
    
    func validateEmail() {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
    }
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}




    
