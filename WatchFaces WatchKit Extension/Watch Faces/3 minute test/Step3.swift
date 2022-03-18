//
//  Step3.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step3: View {

    var body: some View {
        NavigationView {
            VStack {
                Text("This is step 3 \nThe next step is starting the workout...").multilineTextAlignment(.center)
                NavigationLink("Start Test", destination: MainMinuteTestView())
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Step3_Previews: PreviewProvider {
    static var previews: some View {
        Step3()
    }
}
