//
//  Pyramid View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct PyramidView: View {
    //@Binding var currentWordIndex: Int
    @Binding var isActivityCompleted: Bool
    @Binding var completedWords: [Bool]
    @ObservedObject var child : Child
    
    let word : Word
    
    var body: some View {
        let word = words[child.currentWordIndex]
        let wordParts = splitWord(word.word)

        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)

            VStack {
                
                ProgressBarView(child:child)
                
                
                Text("قسم الكلمة: \(word.word)")
                    .font(.title)
                    .bold()

                VStack {
                    ForEach(0..<wordParts.count, id: \.self) { index in
                        ZStack {
                            Image("part\(index + 1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 600, height: 100)

                            Text(wordParts[index])
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()

                NavigationLink(destination: DragAndDropPyramidView(
                    completedWords: $completedWords, child:child
                )) {
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .foregroundStyle(Color.orange)
                        .frame(width: 78, height: 78)
                    
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }

    func splitWord(_ word: String) -> [String] {
        var parts: [String] = []
        for i in 1...word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            parts.append(String(word[word.startIndex..<index]))
        }
        return parts
    }
}
