//
//  AppHomeView.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

#if DEBUG
struct Test {
    static let testLights : [LightViewModel] = [
        LightViewModel(LightModel(id: 0, deviceName: "Porch", colorSupported: false)),
        LightViewModel(LightModel(id: 1, deviceName: "Dining Room", colorSupported: true))
    ]
}
#endif

struct AppHomeView: View {
    
    @State var lights : [LightViewModel] = {
        #if DEBUG
        return Test.testLights
        #else
        return []
        #endif
    }()
    
    @State var selectedDevice : LightViewModel? = nil
    @State var safeAreaInset : CGFloat = 0.0
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView()
                LightsListView(lightList: $lights,
                               selectedDevice: $selectedDevice)
            }.padding([.leading, .trailing], -10)
            
            if let selected = selectedDevice {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    LightDetailView(currentLight: selected, closeAction: {
                        withAnimation {
                            selectedDevice = nil
                        }
                    })
                    .cornerRadius(10.0)
                    .padding(.bottom, 10.0)
                }
                
                .transition(.move(edge: .bottom))
                .offset(y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView()
    }
}
