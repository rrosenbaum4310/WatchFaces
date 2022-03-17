//
//  HeartRateFace.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import SwiftUI
import HealthKit

struct HeartRateFace: View {
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")

    @State private var value = 0

    var body: some View {
        VStack(alignment: .center) {
            Text("❤️")
                    .font(.system(size: 80))
                

            HStack {
                Text("\(value)")
                    .fontWeight(.regular)
                    .font(.system(size: 70))

                Text("BPM").font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .offset(y: 15)

            }

        }
        .padding()
        .onAppear(perform: start)
    }

    func start() {
        authorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }

    func authorizeHealthKit() {
        let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }

    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {

        // 1
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        // 2
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            _, samples, _, _, _ in

            // 3
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }

        self.process(samples, type: quantityTypeIdentifier)

        }

        // 4
        let query = HKAnchoredObjectQuery(
                                        type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!,
                                          predicate: devicePredicate,
                                          anchor: nil,
                                          limit: HKObjectQueryNoLimit,
                                          resultsHandler: updateHandler)

        query.updateHandler = updateHandler

        // 5

        healthStore.execute(query)
    }

    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0

        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }

            self.value = Int(lastHeartRate)
        }
    }
}

struct HeartRateFace_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateFace()
    }
}
