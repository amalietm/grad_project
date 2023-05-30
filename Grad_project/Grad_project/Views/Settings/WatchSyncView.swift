//
//  WatchSyncView.swift
//  Grad_project
//
//  Created by Amalie Morch on 22/05/2023.
//

import SwiftUI

struct WatchSyncView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Text("hello")
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.gray)
                        }
                    }
                }
            
        }
    }
}

struct WatchSyncView_Previews: PreviewProvider {
    static var previews: some View {
        WatchSyncView()
    }
}
