//
//  LightDetailView.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

struct LightDetailView : View {
    @ObservedObject var currentLight : LightViewModel
    
    var shortcutsURL : URL = URL(string: "shortcuts://")!
    
    var closeAction: ()->()
    var body: some View {
        
        VStack(spacing: 1.0) {
            VStack(spacing: 5.0) {
                LightLineView(currentLight: currentLight)
                    .padding([.leading, .trailing, .top], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                LineSpacer()
            }
            
            VStack(spacing: 3.0) {
                HStack {
                    Text("Brightness")
                    Spacer()
                }
                HStack {
                    let sliderBinder = Binding<Double>(
                        get: { return currentLight.brightness },
                        set: { currentLight.brightness = $0 }
                    )
                    
                    Text("\(Int(currentLight.brightness))%")
                    Slider(value: sliderBinder, in: 0...100)
                        .accentColor(.purple)
                }
                
                
                
            }.padding()
            
            LineSpacer()
            
            if currentLight.colorSupported {
                let colorBinder = Binding<Color>(
                    get: { return currentLight.lightColor },
                    set: { currentLight.lightColor = $0 }
                )
                
                ColorPicker("Color", selection: colorBinder)
                    .padding()
                
                LineSpacer()
            }
            
            VStack(spacing: 10.0) {
                if UIApplication.shared.canOpenURL(shortcutsURL) {
                    Button(action: {
                        withAnimation {
                            UIApplication.shared.open(shortcutsURL, options: [:], completionHandler: nil)
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 40.0)
                                .foregroundColor(.purple)
                            Text("Automate with Shortcuts")
                                .foregroundColor(.white)
                            
                        }
                    })
                    

                }
                
                Button(action: {
                    withAnimation {
                        closeAction()
                    }
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 40.0)
                            .foregroundColor(.white)
                            .border(Color.purple)
                        Text("Close")
                            .foregroundColor(.purple)
                        
                    }
                })
            }.padding()
            
            
            
            
        }
        .background(Color.white)
        
    }
    
    struct LineSpacer : View {
        var body: some View {
            Rectangle()
                .frame(height: 1.0)
                .foregroundColor(.gray)
                .opacity(0.4)
                .padding()
        }
    }
}

#if DEBUG
struct LightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LightDetailView(currentLight: Test.testLights.first!, closeAction: {})
    }
}
#endif
