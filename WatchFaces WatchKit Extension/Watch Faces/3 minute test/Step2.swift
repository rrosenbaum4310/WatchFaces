//
//  Step2.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step2: View {

    var body: some View {
        NavigationView {
            VStack {
                Text("This is step 2 \nProceed to step 3?").multilineTextAlignment(.center)
                NavigationLink("Next", destination: Step3())
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Step2_Previews: PreviewProvider {
    static var previews: some View {
        Step2()
    }
}
