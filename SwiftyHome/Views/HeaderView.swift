//
//  HeaderView.swift
//  SwiftyHome
//
//  Created by João Leite on 21/06/21.
//

import SwiftUI

struct HeaderView : View {
    
    var body: some View {
        HStack() {
            VStack {
                Image(systemName: "cloud.sun.fill")
                    .foregroundColor(.white)
                
                Text("23° C")
                    .foregroundColor(.white)
                
            }
            
            VStack(alignment: .leading) {
                Text("Hello Swifty")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Your lights are on. Consider turning them off during the day.")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            
        }
        .padding()
        .background(Color.purple)
        
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
