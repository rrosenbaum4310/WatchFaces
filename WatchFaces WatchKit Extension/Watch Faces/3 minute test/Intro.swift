//
//  introduction.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI

struct Intro: View {
    @State var lottieFile: String = "swim-dive"
    @ObservedObject var viewModel: LottieFileManager = .init()

    var body: some View {
        NavigationView {
            ZStack {
         
                VStack {
                    VStack{
                    Text("Welcome to the Phlex")
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        
                        Text("3 Minute Challenge")
                            .font(.system(size: 16, weight: .black, design: .rounded))
                        
                    
                    Text("I'll be your guide today. Let's dive in")
                            .font(.system(size: 8))
                       Spacer()
//                            .padding()
                    }.padding(.top, 45)
                    
                  
                }
                VStack {
                    Image(uiImage: viewModel.image)
                        .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 30)
                    Spacer()
                    NavigationLink("Start", destination: Step1(viewModel: viewModel).edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all))
                    Spacer()
                }.edgesIgnoringSafeArea(.all)
                .padding()
//                    .frame(width: 125, height: 80, alignment: .center)
            }.edgesIgnoringSafeArea(.all)
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
        
            .onAppear {
                self.viewModel.loadAnimationFromFile(filename: lottieFile)
            }
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
