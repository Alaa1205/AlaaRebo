//
//  Drop and Drag Pyramid View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct DragAndDropPyramidView: View {
   // @Binding var currentWordIndex: Int
    @Binding var completedWords: [Bool]

    @State private var droppedParts: [String?] = [nil, nil, nil, nil]
    @State private var isPartCorrect: [Bool] = [false, false, false, false]

    @ObservedObject var child : Child
    
    @State private var navigateToHomePage = false  // Flag to trigger navigation
    @State private var showCompletionPopup = false // Flag to show the completion popup
    var wordParts: [String] {
        let word = words[child.currentWordIndex]
        return splitWord(word.word)
    }

    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)

            VStack {
                
                ProgressBarView(child:child)
                
                Text("اسحب الأجزاء إلى الأماكن الصحيحة")
                    .font(.title)
                    .bold()
                    .padding()

                
                HStack{
                    
                    VStack(spacing: 30) {
                        ForEach(0..<wordParts.count, id: \.self) { index in
                            ZStack {
                                
                                Image("part\(index + 1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 600, height: 100)
                                    
                                
                                

                                if let part = droppedParts[index] {
                                    Text(part)
                                        .font(.largeTitle)
                                    
                                        .foregroundColor(isPartCorrect[index] ? .black : .red)
                                }
                            }
                            .onDrop(of: [.text], isTargeted: nil) { providers in
                                handleDrop(providers: providers, at: index)
                            }
                        }
                    }

                    
                    
                    ZStack{
                        
                        Spacer()
                        Rectangle().fill(Color("StichyNotes Rectangle")).frame(width: 140, height: 400).cornerRadius(20)
                        
                        
                        VStack {
                            ForEach(wordParts, id: \.self) { part in
                                if !droppedParts.contains(part) {
                                    DraggablePart(part: part)
                                }
                            }
                        }
                        
                    }
                   
                    
                }
                
              

         
                
               // if isPartCorrect.allSatisfy({ $0 }) {
                    NavigationLink(
                        destination: SandDrawView(child:child, completedWords: $completedWords),
                        label: {
                            Image(systemName: "arrow.backward.circle")
                                .resizable()
                                .foregroundStyle(Color.orange)
                                .frame(width: 78, height: 78)
                        }
                    )
                

                    .padding()
            }
           
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

    func handleDrop(providers: [NSItemProvider], at index: Int) -> Bool {
        if let provider = providers.first(where: { $0.canLoadObject(ofClass: String.self) }) {
            _ = provider.loadObject(ofClass: String.self) { item, _ in
                if let text = item as? String {
                    DispatchQueue.main.async {
                        if text == wordParts[index] {
                            droppedParts[index] = text
                            isPartCorrect[index] = true
                        } else {
                            isPartCorrect[index] = false
                            // Animation to return the part to its original position
                        }
                    }
                }
            }
            return true
        }
        return false
    }
    

}



struct DraggablePart: View {
    let part: String

    var body: some View {
        
        ZStack{
            
            
            Text(part)
                .font(.headline)
                .frame(width: 50, height: 50)
                .padding()
                .background(Color("StickyNoteColor"))
                .cornerRadius(10)
                .onDrag {
                    NSItemProvider(object: part as NSString)
                    
                    
                }
            
            
            
        }
        
    }
}
