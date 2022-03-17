//
//  ContentView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Swim Smart Dashboard", destination: SwimSmartDashboard())
                NavigationLink("Timer Face", destination: TimerFace())
                NavigationLink("Heart Rate Face", destination: HeartRateFace())
                NavigationLink("Lap Data Face", destination: LapDataFace())
                NavigationLink("Splash View", destination: SplashView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
