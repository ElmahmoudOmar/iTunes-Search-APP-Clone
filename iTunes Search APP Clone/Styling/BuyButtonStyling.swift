//
//  BuyButtonStyling.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 3/11/2023.
//

import SwiftUI

struct BuyButtonStyling: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundColor(.blue)
            .padding(.vertical,7)
            .padding(.horizontal,14)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.init(uiColor: .systemGray4))
                    .opacity(configuration.isPressed ? 0.5 : 1)
            }
    }
    
}

struct BuyButtonStyling_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button ("1 usd"){
            }.buttonStyle(BuyButtonStyling())

        }
    }
}
