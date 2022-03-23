//
//  Step3.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step3: View {
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerStarted: Bool = false
    let lottieFile = "wave-chart-blue"
    @ObservedObject var viewModel = LottieFileManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                if timerStarted == true {
                    ZStack {
                        
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            Text("Time: \(timeRemaining)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            NavigationLink("End Test", destination: MainMinuteTestView(viewModel: viewModel)).onTapGesture {
                                print("5 second countdown, then a 5 minute timer begins...")
                            }
                        }.offset(y: 15)
                    }
                } else {
                        ZStack {
                            
                            Image(uiImage: viewModel.image)
                                .resizable().aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("You are now warmed up and ready to go!")
                                    .font(.system(size: 12, weight: .black, design: .rounded))
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("• Remember to swim all the way to the wall after the timer ends.")
                                        .font(.system(size: 8, weight: .medium, design: .rounded))
                                    
                                    
                                    Text("• Goodluck and give it your ALL!")
                                        .font(.system(size: 8, weight: .medium, design: .rounded))
                                    
                                }
                                
                                
                                
                                Button("Begin Test") {
                                    timerStarted.toggle()
                                }.padding()
                                
                                
                                
                            }.padding(.top, 35).padding(.horizontal)
                        }
                    
                }
            }.onAppear {
                self.viewModel.loadAnimationFromFile(filename: lottieFile)
        }
        }
    }
}

struct Step3_Previews: PreviewProvider {
    static var previews: some View {
        Step3(timerStarted: true)
    }
}
