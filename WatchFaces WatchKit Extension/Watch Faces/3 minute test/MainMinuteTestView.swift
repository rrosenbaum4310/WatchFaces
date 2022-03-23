//
//  MainMinuteTestView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct MainMinuteTestView: View {
    let lottieFile = "champion-trophy"
    @ObservedObject var viewModel: LottieFileManager = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .center)
                
                
                VStack(alignment: .leading) {
                    
                    Text("Congratulations on completing the 3-Minute Challenge!")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .padding(.vertical)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        
                        Text("• This is your first step to faster swimming.")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                        
                        Text("• To learn more, visit the Phlex Swim Mobile App.")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                        
                        Text("• Try to keep your best technique.")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                        
                    }
                    .foregroundColor(Color.init(hex: "74d1f6"))
                    
                    NavigationLink("Go Home", destination: ContentView())

                }.padding(.top, 15)
                
            }.onAppear {
                self.viewModel.loadAnimationFromFile(filename: lottieFile)
            }
        }
    }
}

struct MainMinuteTestView_Previews: PreviewProvider {
    static var previews: some View {
        MainMinuteTestView(viewModel: LottieFileManager())
    }
}
