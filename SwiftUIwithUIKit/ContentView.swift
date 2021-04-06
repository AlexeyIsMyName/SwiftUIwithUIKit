//
//  ContentView.swift
//  SwiftUIwithUIKit
//
//  Created by ALEKSEY SUSLOV on 06.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 50.0
    @State private var targetValue = 0.0
    @State private var alertIsPresented = false
    
    private var score: Int {
        let difference = abs(value - targetValue)
        return lround(100 - difference)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(lround(targetValue))")
                .multilineTextAlignment(.center)
            
            HStack {
                Text("0")
                SliderFromUIKit(value: $value, thumbAlpha: Double(score) / 100)
                Text("100")
            }
            
            Button(action: checkResult) {
                Text("Проверь меня!")
            }.alert(isPresented: $alertIsPresented) {
                Alert(
                    title: Text("Your Score"),
                    message: Text("\(score)")
                )
            }
            
            Button(action: newRandomValue) {
                Text("Начать заново")
            }
        }
        .onAppear(perform: newRandomValue)
        .padding()
    }
}

extension ContentView {
    private func checkResult() {
        alertIsPresented.toggle()
    }
    
    private func newRandomValue() {
        targetValue = Double.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
