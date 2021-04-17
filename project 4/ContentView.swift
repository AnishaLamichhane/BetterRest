
 //
//  ContentView.swift
//  project 4
//
//  Created by Anisha Lamichhane on 4/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter your time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount to sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g")hours")
                }
                
                Text("Dailly coffee intake")
                    .font(.headline)
                
                Stepper(value: $coffeeAmount, in: 1...20) {
                    if coffeeAmount == 1 {
                        Text("One cup")
                    }else {
                        Text("\(coffeeAmount)cups")
                    }
                }
                
                
            }
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing:
//  here we have used calculateBedtime() without patenthesis because thaat means that call the function when button is tapped and the function returns a closute to run
//   but while only writing the name without patenthesis means run the function when button is tappes without expecting return or anything
                Button (action: calculateBedtime) {
                    Text("Calculate")
                }
            )
        }
        
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(input: wake: Double(hour + minute), estimatedSleep: Double(sleepAmount), coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter  = DateFormatter()
            formatter.timeStyle = .short
        }
        catch {
            //somrthing went wrong
            alertTitle = "Error"
            alertMessage = "Sorry ! we could not calculate your bedtime"
        }
        showingAlert = true
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
