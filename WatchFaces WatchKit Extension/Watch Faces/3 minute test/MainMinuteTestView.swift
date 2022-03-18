//
//  MainMinuteTestView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct MainMinuteTestView: View {

    var body: some View {
        NavigationView {
        VStack {
            Text("Timer from 3 down to 1. They should be going all out and not stopping.").multilineTextAlignment(.center)
        NavigationLink("Go Home", destination: ContentView())
        }
    }
    }
}

struct MainMinuteTestView_Previews: PreviewProvider {
    static var previews: some View {
        MainMinuteTestView()
    }
}
