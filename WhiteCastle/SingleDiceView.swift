//
//  SingleDiceView.swift
//  WhiteCastle
//
//  Created by Ich on 11.08.24.
//

import SwiftUI

struct SingleDiceView: View {
    var dice: Dice
    
    var body: some View {
        Image("\(dice.color.rawValue)-\(dice.value)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    SingleDiceView(dice: Dice(color: .white, value: 2))
}
