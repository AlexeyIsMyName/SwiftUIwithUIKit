//
//  ContentView.swift
//  SwiftUIwithUIKit
//
//  Created by ALEKSEY SUSLOV on 06.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 50.0
    @State private var targetValue = 0
    @State private var alertIsPresented = false
    
    private var score: Int {
        let difference = abs(lround(value) - targetValue)
        return 100 - difference
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер\nкак можно ближе к: \(targetValue)")
                .multilineTextAlignment(.center)
            
            SliderUI(value: $value, thumbAlpha: score)
        
            Button(action: showResult) {
                Text("Проверь меня!")
            }.alert(isPresented: $alertIsPresented) {
                Alert(
                    title: Text(
                        score == 100 ?
                            "You are the best!" :
                            "You can do better! Just try!"
                    ),
                    message: Text("Your Score is \(score)")
                )
            }
            
            Button(action: newRandomTarget) {
                Text("Начать заново")
            }
        }
        .onAppear(perform: newRandomTarget)
        .padding()
    }
}

extension ContentView {
    private func showResult() {
        alertIsPresented.toggle()
    }
    
    private func newRandomTarget() {
        targetValue = Int.random(in: 0...100)
    }
}

struct SliderUI: View {
    @Binding var value: Double
    let thumbAlpha: Int // 0..100
    
    var body: some View {
        HStack {
            Text("0")
            SliderFromUIKit(value: $value, thumbAlpha: Double(thumbAlpha) / 100)
            Text("100")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
