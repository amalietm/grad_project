//
//  ChartView.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

// Followed tutorial: Budget App Recreation: SwiftUI Charts & Custom Segmented Picker (with source code)
// link: https://www.youtube.com/watch?v=zk0gwmfgC4I

import SwiftUI
import Charts


struct ChartView: View {
    @State var selectedTab = "Weekly"
    var tabs = ["Weekly", "Monthly"]
    
    var chartData = ["Weekly" : [SavingsDataPoint(calender: "Mon", value: 7),
                      SavingsDataPoint(calender: "Tue", value: 6),
                      SavingsDataPoint(calender: "Wed", value: 2),
                                 SavingsDataPoint(calender: "Thu", value: 3.8),
                      SavingsDataPoint(calender: "Fri", value: 9),
                                 SavingsDataPoint(calender: "Sat", value: 3.4),
                      SavingsDataPoint(calender: "Sun", value: 3)],
                     "Monthly" : [SavingsDataPoint(calender: "Week", value: 27.2),
                      SavingsDataPoint(calender: "Jun", value: 33),
                      SavingsDataPoint(calender: "Jul", value: 15),
                      SavingsDataPoint(calender: "Aug", value: 21),
                                  SavingsDataPoint(calender: "Sep", value: 36.4),
                      SavingsDataPoint(calender: "Oct", value: 42),
                      SavingsDataPoint(calender: "Nov", value: 12)]]
    
    var body: some View {
        
        ScrollView {
            SegementedPicker(selected: $selectedTab, options: tabs)
                .padding()
            
            
            BarChartView(data: chartData[selectedTab]!)
                .frame(minHeight: 200)
                .padding()
                .animation(.easeOut, value: selectedTab)
        }
    }
}


struct SavingsDataPoint: Identifiable {
    let calender: String
    let value: Double
    var id = UUID()
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
