//
//  LightsListView.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

struct LightsListView : View {
    @Binding var lightList : [LightViewModel]
    @Binding var selectedDevice : LightViewModel?
    
    var body: some View {
        List(lightList, id: \.id) { light in
            LightLineView(currentLight: light)
                .onTapGesture {
                    withAnimation {
                        selectedDevice = light
                    }
                }
        }
    }
}

struct LightsListView_Previews: PreviewProvider {
    static var previews: some View {
        LightsListView(lightList: .constant([]), selectedDevice: .constant(nil))
    }
}
