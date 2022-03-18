//
//  Step1.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step1: View {

    var body: some View {
        NavigationView {
            VStack {
                Text("This is step 1 \nProceed to step 2?").multilineTextAlignment(.center)
                NavigationLink("Next", destination: Step2())
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Step1_Previews: PreviewProvider {
    static var previews: some View {
        Step1()
    }
}
