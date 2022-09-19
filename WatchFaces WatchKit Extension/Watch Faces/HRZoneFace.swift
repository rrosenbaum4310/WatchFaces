//
//  HRZoneFace.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/24/22.
//

import SwiftUI
import Charts

struct HRZoneFace: View {
    @StateObject var valuePublisher = ValuePublisher()
    @State var doubleQueue = Queue<Double>()

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Zone")
                    Text("5.9")
                        .font(.largeTitle)
                    Label("Time", systemImage: "clock")
                    
                Label("Cals", systemImage: "flame")
                    
                Label("HR", systemImage: "heart")
                }
                
                Chart(data: doubleQueue.list)
                    .chartStyle(
                        StackedColumnChartStyle(spacing: 2, cornerRadius: 3, colors: [.yellow, .orange, .red])
                    )
           
                
            }.edgesIgnoringSafeArea(.all)
        }.onAppear {
            doubleQueue.list = [Double](repeating: 0.0, count: 20)
        }
        .onChange(of: valuePublisher.value) { value in
            self.doubleQueue.enqueue(value)
            _ = self.doubleQueue.dequeue()
        }
    }
}

struct HRZoneFace_Previews: PreviewProvider {
    static var previews: some View {
        HRZoneFace()
    }
}

class ValuePublisher: ObservableObject {
    @Published var value: Double = 0.0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            self.value = Double.random(in: 0...1.0)
        }
    }
}
struct Queue<T> {
    var list = [T]()
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        if !list.isEmpty {
            return list[0]
        } else {
            return nil
        }
    }
}
