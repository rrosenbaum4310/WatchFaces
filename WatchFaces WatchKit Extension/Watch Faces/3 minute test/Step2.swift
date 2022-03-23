//
//  Step2.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step2: View {
    let lottieFile: String = "swim"
    @ObservedObject var viewModel: LottieFileManager = .init()
    @State var warmingUp: Bool = false
    var body: some View {
        NavigationView {        // OLD VIEW
            ZStack {
                
                Image(uiImage: viewModel.image)
                    .resizable().aspectRatio(contentMode: .fit)
                    .offset(y: -60)
                
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Let’s start with a 5 minute warmup")
                            .font(.system(size: 12, weight: .black, design: .rounded))
                        
                        VStack(alignment: .leading) {
                            Text("• Swim at a moderate pace")
                                .font(.system(size: 8, weight: .medium, design: .rounded))
                            Text("• We'll let you know when the 5 minutes is up.")
                                .font(.system(size: 8, weight: .medium, design: .rounded))
                            
                            Text("• Example warm up: 4 x 100 free with 10 seconds rest.")
                                .font(.system(size: 8, weight: .medium, design: .rounded))
                            
                        }.foregroundColor(Color.init(hex: "74d1f6"))
                        
                        
                        NavigationLink("Start Warmup", destination: Step3(viewModel: viewModel))
                        
                        
                        
                        
                    }.padding(.top, 25)
                
            }
        }.onAppear {
            self.viewModel.loadAnimationFromFile(filename: lottieFile)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}



struct Step2_Previews: PreviewProvider {
    static var previews: some View {
        Step2(viewModel: LottieFileManager())
    }
}

