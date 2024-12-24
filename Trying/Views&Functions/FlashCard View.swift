//
//  FlashCard View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct FlashcardView: View {
    //@Binding var currentWordIndex: Int
    @Binding var isActivityCompleted: Bool
    @Binding var completedWords: [Bool]
    @ObservedObject var child: Child

    var body: some View {
        let word = words[child.currentWordIndex]

        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack(spacing:90){
                
                ProgressBarView(child:child)
                
        
                
                HStack{
                    // Left Side: Image
                    ZStack {
                        
                        Color("White")
                        
                        Image(word.imageName) // Replace with your image name
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        
                        
                    }
                    .frame(width: 250, height: 350)
                    .cornerRadius(10)
                    
                    // Right Side: Text
                    ZStack {
                        Color(word.backgroundColor) // Map string to color
                            .opacity(1.0) // Ensure background visibility
                        Text(word.word)
                            .font(.largeTitle)
                            .foregroundStyle(.black)// Text color
                            .bold()
                    }
                    .frame(width: 250, height: 350)
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.black)
                            .padding(),
                        alignment: .topTrailing
                    )
                }
                
                NavigationLink(destination: PyramidView(
                    
                    isActivityCompleted: $isActivityCompleted,
                    completedWords: $completedWords, child:child, word:word
                )) {
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .foregroundStyle(Color.orange)
                        .frame(width: 78, height: 78)
                    
                }

            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}
