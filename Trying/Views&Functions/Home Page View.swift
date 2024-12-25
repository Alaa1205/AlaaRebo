//
//  Home Page View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct HomePage: View {
    
    //@State var currentWordIndex: Int
    @ObservedObject var child: Child
    //@AppStorage("currentWordIndex") private var currentWordIndex = 0
    //@State private var currentWordIndex = 0
    @State private var isActivityCompleted = false
    @Binding  var completedWords: [Bool]
    
    
    
    var body: some View {
        
        let word = words[child.currentWordIndex]
      
        //var completedWords = [false, false, false]
        
        NavigationStack {
            
            
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)

                // Path between the homes
                Image("Path")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1500, height: 3300)
                    .position(x: 700, y: 450)
                
               
                   
                        
                        
                        
//                        ForEach(completedWords.indices, id: \.self) { index in
//                           
//                            
//                            
//                            if completedWords[index] {
//                                
//                                HStack{
//                                    
//                                    ZStack {
//                                        Circle()
//                                            .fill(Color("Circles"))
//                                            .frame(width: 100, height: 100)
//                                            
//                                            .shadow(color: Color("circleShadow"), radius: 12)
//
//                                        Text(word.word)
//                                            .font(.largeTitle)
//                                            .foregroundStyle(Color(.white))
//                                            .bold()
//                                    }
//                                    
//                                    
//                                }
//                            
//                            }
//                        }
                VStack {
                ForEach(completedWords.indices, id: \.self) { index in
                    if completedWords[index] {
                        let completedWord = words[index] // Fetch the word for the current index
                        
                        
                            ZStack {
                                Circle()
                                    .fill(Color("Circles"))
                                    .frame(width: 100, height: 100)
                                    .shadow(color: Color("circleShadow"), radius: 12)

                                Text(completedWord.word) // Use the dynamically fetched word
                                    .font(.largeTitle)
                                    .foregroundStyle(Color(.white))
                                    .bold()
                            }
                        }
                    }
                }


                        
                    
                
                
                
                
                
                NavigationLink(destination: FlashcardView(
                    
                    isActivityCompleted: $isActivityCompleted,
                    completedWords: $completedWords, child:child
                )) {
                    Image("BigeHome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 260)
                }
                .position(x: 200, y: 150)
                
                Button(action: {
                    // Action for big home
                }) {
                    Image("BrownHome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 400)
                }
                .position(x: 900, y: 550)
                
                

                Image("character")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 517, height: 721)
                    .position(x: 150, y: 700)
            }
        }
    }
    
    
    
}
