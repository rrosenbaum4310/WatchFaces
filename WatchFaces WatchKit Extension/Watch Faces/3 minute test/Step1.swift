//
//  Step1.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Step1: View {
    @State var lottieFile: String = "breastroke"
    @ObservedObject var viewModel: LottieFileManager = .init()

  
    var body: some View {
        NavigationView {
            ZStack {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(y: -50)
                VStack(alignment: .leading) {
                        
                    Text("The 3-Minute Challenge is simple!")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                    Spacer()

                    VStack(alignment: .leading) {
                    Text("• Swim Freestyle at 100% effort for 3 minutes!")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                        
                    
                    Text("• Try your best to swim the entire time without stopping.")
                            .font(.system(size: 8, weight: .medium, design: .rounded))

                    
                    Text("• Try to keep your best technique.")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                        
                    }.foregroundColor(Color.init(hex: "74d1f6"))
                    
                    NavigationLink("Next", destination: Step2(viewModel: viewModel)).padding()
                    
                }.padding(.top, 35)
            }.edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all)
        }.onAppear {
            self.viewModel.loadAnimationFromFile(filename: lottieFile)}
        .navigationBarBackButtonHidden(true)
    }
}

struct Step1_Previews: PreviewProvider {
    static var previews: some View {
        Step1(viewModel: LottieFileManager())
    }
}
