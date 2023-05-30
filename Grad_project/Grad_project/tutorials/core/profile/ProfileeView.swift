////
////  ProfileView.swift
////  Grad_project
////
////  Created by Amalie Morch on 28/05/2023.
////
//
//import SwiftUI
//
//// load user profile
//@MainActor
//final class ProfileeViewModel: ObservableObject {
//    @Published private(set) var user: AuthDataResultModel? = nil
//    
//    func loadCurrentUser() throws {
//        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
//    }
//}
//
//struct ProfileeView: View {
//    @StateObject var viewModel = ProfileeViewModel()
//    
//    var body: some View {
//        List {
//            if let user = viewModel.user {
//                Text("userID: \(user.uid)")
//            }
//        }
//        .onAppear {
//            try? viewModel.loadCurrentUser()
//        }
//        .navigationTitle("Profile")
//    }
//        
//}
//
//struct ProfileeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            ProfileView()
//        }
//    }
//}
