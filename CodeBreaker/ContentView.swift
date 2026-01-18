//
//  ContentView.swift
//  CodeBreaker
//
//  Created by James Tench on 1/17/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red, .yellow, .purple, .yellow])
            pegs(colors: [.black, .yellow, .green, .yellow])
            pegs(colors: [.red, .yellow, .orange, .yellow])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchedMarkers(matches: [.exact, .nomatch, .inexact, .exact])
        }
    }
}





#Preview {
    ContentView()
}
