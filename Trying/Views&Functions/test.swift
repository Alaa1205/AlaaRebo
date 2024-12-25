//
//  test.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct test: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Image("part1")
            .renderingMode(.template)
            .foregroundStyle(.green)
    }
}

#Preview {
    test()
}
