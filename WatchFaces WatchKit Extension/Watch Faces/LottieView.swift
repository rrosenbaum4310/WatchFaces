//
//  LottieView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct LottieView: View {
    @ObservedObject var viewModel: LottieFileManager = .init()
    
    var body: some View {
        ZStack {
            
            Text("Backstroke")
                .font(.largeTitle)
                .foregroundColor(ColorManager.darkblue)
                .offset(y: 70)
            
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .onAppear {
                    self.viewModel.loadAnimationFromFile(filename: "swim")
            }
                
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView()
    }
}
