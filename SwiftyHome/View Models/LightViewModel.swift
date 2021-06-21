//
//  LightViewModel.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

class LightViewModel: ObservableObject {

    internal var model : LightModel
    
    var id: Int {
        get {
            model.id
        }
    }
    
    var deviceName : String {
        get {
            model.deviceName
        }
    }
    
    var colorSupported : Bool {
        get {
            model.colorSupported
        }
    }
    
    @Published var isOn : Bool = true
    @Published var brightness : Double = 100.0
    @Published var lightColor = Color(.sRGB, red: 1.0, green: 0, blue: 0)
    
    init(_ light: LightModel) {
        self.model = light
    }
}
