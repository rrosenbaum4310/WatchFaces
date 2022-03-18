//
//  LottieView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct LottieView: View {
    @ObservedObject var viewModel: LottieFileManager = .init()
    @State private var hideStatusBar = false
    @State var lottieFile: String = "health-care"
    var body: some View {
        ZStack {

            VStack {
                Text("strokeName")
                    .font(.title2)
                    .foregroundColor(ColorManager.lightBlue)
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Button("Toggle Status Bar") {
                    withAnimation {
                        hideStatusBar.toggle()
                            navigationBarHidden(true)
                    }
                }
            }.padding()
        }
        .onAppear {
            self.viewModel.loadAnimationFromFile(filename: lottieFile)
        }
        
    }
}


struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView()
    }
}
