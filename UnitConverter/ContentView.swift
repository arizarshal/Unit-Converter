//
//  ContentView.swift
//  UnitConverter
//
//  Created by ariz arshal on 23/12/25.
//

import SwiftUI

struct ContentView: View {
    let units: [String] = ["meter", "kilometer", "centimeter", "millimeter"]
    
    @State private var inputValue = ""
    @State private var inputUnit = "meter"
    @State private var outputUnit = "kilometer"
    
//    computed property
    var resultvalue: Double {
        convertLength()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Enter Value"){
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section("Choose Input Unit") {
                    Picker("Choose Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("To") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Result Value"){
                    Text(convertLength(), format: .number)
                        .font(.title)
                        .foregroundColor(resultvalue == 0 ? .red : .green)
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
    
    func convertLength() -> Double {
        let value = Double(inputValue) ?? 0
        
        // Step 1: Convert input to meters
        let valueInMeters: Double
        switch inputUnit {
        case "kilometer":
            valueInMeters = value * 1000
        case "centimeter":
            valueInMeters = value / 100
        case "millimeter":
            valueInMeters = value / 1000
        default:
            valueInMeters = value
        }
        
        switch outputUnit {
        case "kilometer":
            return valueInMeters / 1000
        case "centimeter":
            return valueInMeters * 100
        case "milimeter":
            return valueInMeters * 1000
        default:
            return valueInMeters
        }
        
    }

}



#Preview {
    ContentView()
}
