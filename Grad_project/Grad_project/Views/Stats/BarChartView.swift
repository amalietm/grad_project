//
//  BarChartView.swift
//  Grad_project
//
//  Created by Amalie Morch on 25/04/2023.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data: [SavingsDataPoint]

    
    var body: some View {
        
        VStack {
            Chart {
                ForEach(Array(data.enumerated()), id: \.offset)  { index, element in
                    BarMark(x: .value("calender", element.calender), y: .value("value", element.value),width: .fixed(25))
                        .foregroundStyle(index % 2 == 0 ? Color("Green") : Color("Orange"))
                        .cornerRadius(5)
                        .annotation(position: .top) {
                            Text(String(element.value))
                                .foregroundColor(Color.gray)
                                .font(.system(size: 12))
                        }
                }
            }
            // chart styling taken from https://swiftuirecipes.com/blog/styling-swiftui-chart-with-charts-framework?utm_content=cmp-true
            
            .chartXAxis {
              AxisMarks(values: .automatic) { _ in
                AxisValueLabel()
              }
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic) { value in
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            if intValue < 1000 {
                                Text("\(intValue)")
                                    .font(.body)
                            } else {
                                
                                // change this to be more usable
                                Text("\(intValue/1000)\(intValue == 0 ? "" : "k")")
                                    .font(.body)
                            }
                        }
                    }
                }
            }
        }
    }
}

