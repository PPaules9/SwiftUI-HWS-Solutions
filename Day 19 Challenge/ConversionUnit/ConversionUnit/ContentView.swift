
import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Centi Meters"
    @State private var outputUnit = "Meters"
    @State private var value = 0.0
    
    @FocusState private var amountIsFocused : Bool
    
    let chosenInput = ["Meters", "Centi Meters", "MilliMeters"]
    let chosenOutput = ["Meters", "Centi Meters", "MilliMeters"]
    
    //The Calculation Part
    var answer : Double {
        if outputUnit == "Meters" {
            var toMeters = 0.0
            if inputUnit == "Centi Meters" {
                toMeters = Double(value / 100)
                return toMeters
            } else if inputUnit == "MilliMeters" {
                toMeters = Double(value / 1000)
                return toMeters
            } else {
                return value
            }
        } else if outputUnit == "Centi Meters" {
            var toCm = 0.0
            if inputUnit == "Meters" {
                toCm = Double(value * 100)
                return toCm
            } else if inputUnit == "MilliMeters" {
                toCm = Double(value / 10)
                return toCm
            } else {
                return value
            }
        } else if outputUnit == "MilliMeters" {
            var toMm = 0.0
            if inputUnit == "Meters" {
                toMm = Double(value * 1000)
                return toMm
            } else if inputUnit == "Centi Meters" {
                toMm = Double(value * 10)
                return toMm
            } else {
                return value
            }
        } else {
            return value
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $value, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                Section("input"){
                    Picker("input Unit", selection: $inputUnit) {
                        ForEach(chosenInput, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output"){
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(chosenOutput, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                Section("Answer"){
                    Text(answer, format: .number)
                }
            }
            .navigationTitle("ConversionUnit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
                
            }
        }
    }
}
#Preview {
    ContentView()
}

