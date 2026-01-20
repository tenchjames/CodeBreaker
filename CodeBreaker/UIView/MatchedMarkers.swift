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
    // MARK: Data In
    let matches: [Match]
    
    // MARK: - Body
    var body: some View {
//        let columns = [GridItem(.fixed(30)), GridItem(.fixed(30))]
//        LazyVGrid(columns: columns) {
//            ForEach(matches.indices, id: \.self) { index in
//                matchMarker(peg: index)
//            }
//        }
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
    let code = Code(kind: .guess, pegs: [.red, .blue, .green, .yellow])
    HStack {
        ForEach(code.pegs.indices, id: \.self) { index in
            RoundedRectangle(cornerRadius: 10)
                .overlay {
                    if code.pegs[index] == Code.missingPeg {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray)
                    }
                }
                .contentShape(Rectangle())
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(code.pegs[index])
        }

        MatchedMarkers(matches: [.exact, .inexact, ])
    }
}



// MatchedMarkers(matches: [.exact, .inexact, .nomatch, .exact])
