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
    @State var lottieFile: String = "breastroke"
    var body: some View {
        ZStack {

            VStack {
                Text("Breaststroke")
                    .font(.title2)
                    .foregroundColor(ColorManager.lightBlue)
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
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
