//
//  SplashView.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI
import HealthKit

struct SplashView: View {

    @ObservedObject var liveHr = LiveHRManager() // observing the object
    @State private var percent = 70.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State var timerTest: Timer?

    private var healthStore = HKHealthStore()
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle().frame(width: 200, height: 250)
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(liveHr.value) / 200)
                    .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                    .frame(width: 200, height: 250)
                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(liveHr.value) / 200)
                    .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                    .opacity(0.5)
                    .frame(width: 200, height: 250)
                VStack {
                    Text("\(liveHr.value)")
                        .fontWeight(.regular)
                        .foregroundColor(liveHr.getColor())
                    .font(.system(size: 70))
                    Text("Real Time Heart Rate*").font(.system(size: 12)).foregroundColor(.black).fontWeight(.light)
                }

            }.edgesIgnoringSafeArea(.all)
            .onTapGesture {
                guard timerTest == nil else { return }
                timerTest =  Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in

                    if percent > 200 {
                        withAnimation(Animation.linear(duration: 0.03)) {
                            percent += 0.25
                            print(percent)
                        }
                    } else {
                        self.timerTest?.invalidate()
                        self.timerTest = nil
                    }
                }

            }
        }.edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all)

        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
                start()
            }

        }
    }
    func start() {
        liveHr.authorizeHealthKit()
        liveHr.startColorHR(quantityTypeIdentifier: .heartRate)
    }

}

struct Wave: Shape {

    var offset: Angle
    var percent: Double

    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {

        var path = Path()
        let waveHeight = 0.015 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 10) {
            let xFloat = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: xFloat, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }

        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
