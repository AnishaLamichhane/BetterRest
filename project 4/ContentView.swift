
 //
//  ContentView.swift
//  project 4
//
//  Created by Anisha Lamichhane on 4/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
       let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
           return  DatePicker("Please Enter a Date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
