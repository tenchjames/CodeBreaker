//
//  PegChooserView.swift
//  CodeBreaker
//
//  Created by James Tench on 1/19/26.
//
import SwiftUI


struct PegChooserView: View {
    
    // MARK: Data In
    let choices: [Peg]
    
    // MARK: - Data Out
    let onChoose: (Peg) -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) { peg in
                Button {
                    onChoose(peg)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }
}


