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
                NavigationLink("Strokes/lap", destination: StrokesPerLap())

                
                NavigationLink("Main Workout Face", destination: SwimSmartDashboard())
                NavigationLink("3 Minute Test", destination: Intro())
                NavigationLink("HR Zone Face", destination: HRZoneFace())

                NavigationLink("Timer Face", destination: TimerFace())
//                NavigationLink("Heart Rate Face", destination: HeartRateFace())
//                NavigationLink("Lap Data Face", destination: LapDataFace())
//                NavigationLink("Splash View", destination: SplashView())
                
                // MARK: - Used for Lottie development
//                NavigationLink("Lottie View", destination: LottieView())
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
