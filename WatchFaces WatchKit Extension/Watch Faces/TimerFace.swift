//
//  TimerFace.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct TimerFace: View {
    // MARK: - PROPERTIES
    /// 5 minute warm up = 300 seconds
    /// 3 minute test = 180 seconds

    @State var timeRemaining = 300
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let warmingUp: Int = 300
    
    var body: some View {
        VStack {
            Text("Warming Up")
                .font(.caption)
                .monospacedDigit()
            
            Text("\(timeString(time: timeRemaining))")
                .font(.system(size: 80))
//                .frame(height: 80.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.black)
            
            Text("Time Remaining")
                .font(.footnote)
                .monospacedDigit()
                .offset(y: -5)
                .foregroundColor(.gray)
            
        }
        .onReceive(timer){ _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }else{
                self.timer.upstream.connect().cancel()
            }
    }
    }
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
struct TimerFace_Previews: PreviewProvider {
    static var previews: some View {
        TimerFace()
    }
}
