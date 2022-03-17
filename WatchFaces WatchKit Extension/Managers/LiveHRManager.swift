//
//  LiveHRManager.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import Foundation
import HealthKit
import SwiftUI

class LiveHRManager: ObservableObject {
    @Published var value: Int = 0
    let heartRateQuantity = HKUnit(from: "count/min")
    @Published var bpm = 0
    @State private var percent = 70.0

    private var healthStore = HKHealthStore()

    func getValueBinding() -> Binding<Int> {  // This function returns a Binding which can be used in a textfield.
         let binding = Binding<Int>(get: { () -> Int in
             return self.value
         }) { (newValue) in
             self.value = newValue
         }
         return binding
    }

    func getColor() -> Color { // This function calculates a color from the live heart rate value.
        switch value {
        case 70...100: return Color.blue
        case 101...144: return Color.orange
        case 145...174: return Color.purple
        case 175...200: return Color.red
        default: return Color.blue
        }
    }
     func startColorHR(quantityTypeIdentifier: HKQuantityTypeIdentifier) {

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

    func authorizeHealthKit() {
        let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }

     func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 120.0

        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }

            self.value = Int(lastHeartRate)
            self.percent = Double(value)
        }
    }

}

