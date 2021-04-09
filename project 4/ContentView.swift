
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
        Form {
            let now = Date()
            let tomorrow = Date().addingTimeInterval(86400)
            let range = now ... tomorrow
            
            DatePicker("Please Enter a Date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
