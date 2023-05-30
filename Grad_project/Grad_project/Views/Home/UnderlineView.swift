//
//  UnderlineView.swift
//  Grad_project
//
//  Created by Amalie Morch on 21/04/2023.
//
// package downloaded from: https://github.com/QuynhNguyen/SlidingTabView/blob/master/Sources/SlidingTabView/SlidingTabView.swift

import SwiftUI
import SlidingTabView

// make swipable
struct UnderlineView: View {
    @State var tabIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    SlidingTabView(
                        selection: $tabIndex,
                        tabs: ["Inside","Outside"],
                        font: .title3.bold(),
                        animation: .easeInOut,
                        activeAccentColor: Colors.blue,
                        inactiveAccentColor: Color.black.opacity(0.4),
                        selectionBarColor: Colors.blue,
                        inactiveTabColor: Color.clear
                    )
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                if tabIndex == 1 {
                    OutsideView(tabIndex: $tabIndex)
                }
                if tabIndex == 0 {
                    InsideView()
                }

                Spacer()
                
            }
            .navigationTitle("Today's")

        }
    }
}



struct UnderlineView_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineView()
    }
}
