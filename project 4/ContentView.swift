
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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter your time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                //more to come
            }
        }
        
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
