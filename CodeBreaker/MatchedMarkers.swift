//
//  MatchedMarkers.swift
//  CodeBreaker
//
//  Created by James Tench on 1/17/26.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchedMarkers: View {
    var matches: [Match]
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
                
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.count {$0 == .exact}
        let foundCount = matches.count {$0 != .nomatch}
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}
    


#Preview {
    MatchedMarkers(matches: [.exact, .inexact, .nomatch, .exact])
}
