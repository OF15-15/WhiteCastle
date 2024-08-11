//
//  BridgeDiceView.swift
//  WhiteCastle
//
//  Created by Ich on 11.08.24.
//

import SwiftUI

struct BridgeDiceView: View {
    var bridge: Bridge
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                SingleDiceView(dice: bridge.left!)
                VStack(spacing: 0) {
                    ForEach(bridge.dices[1...3]) { dice in
                        SingleDiceView(dice: dice)
                    }
                }
                SingleDiceView(dice: bridge.right!)
            }
        }
    }
}

#Preview {
    BridgeDiceView(bridge: Bridge(color: .red, count: 5))
}
