//
//  LightLineView.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

struct LightLineView : View {
    
    @ObservedObject var currentLight : LightViewModel
    
    var body: some View {
        HStack {
            
            ZStack {
                Image(systemName: "rays")
                    .resizable()
                    .foregroundColor(currentLight.isOn ? .purple : .gray)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .opacity(currentLight.isOn ? 1 : 0)
                    .transition(.opacity)
                
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(currentLight.isOn ? .purple : .gray)
            }
            
            Text(currentLight.deviceName)
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentLight.isOn.toggle()
                }
            }, label: {
                ZStack {
                    Circle()
                        .foregroundColor(currentLight.isOn ? .purple : .gray)
                        .opacity(0.6)
                    
                    Image(systemName: "power")
                        .foregroundColor(.white)
                }.frame(width: 40)
            })
            .buttonStyle(PlainButtonStyle())
            
        }
        .frame(height: 50.0)
    }
}

#if DEBUG
struct LightLineView_Previews: PreviewProvider {
    static var previews: some View {
        LightLineView(currentLight: Test.testLights.first!)
    }
}
#endif
