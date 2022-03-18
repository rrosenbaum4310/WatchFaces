//
//  introduction.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Intro: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("iwatch")
                    .interpolation(.high)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 200, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    Text("Introducing \n3 Minute Testing")
                        .multilineTextAlignment(.center)
                    
                    NavigationLink("Start", destination: Step1())
                }
            }
        }.navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(.all)
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
