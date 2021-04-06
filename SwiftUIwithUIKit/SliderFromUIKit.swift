//
//  SliderFromUIKit.swift
//  SwiftUIwithUIKit
//
//  Created by ALEKSEY SUSLOV on 06.04.2021.
//

import SwiftUI

struct SliderFromUIKit: UIViewRepresentable {
    @Binding var value: Double
    let thumbAlpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(red: 1,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(thumbAlpha))
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 1,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(thumbAlpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderFromUIKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderFromUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderFromUIKit(value: .constant(50), thumbAlpha: 0.5)
    }
}
