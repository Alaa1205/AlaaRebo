//
//  Age View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct AgeSelectionView: View {
    @State private var selectedAge: Int?  // Holds the selected age
    @State private var child: Child?

    @State private var completedWords: [Bool] = [false, false, false]
    let ages = [8, 7, 6, 5]  // Available age options

    var body: some View {
        
        NavigationStack {
            VStack {
                // Title
                Text("اختر عمرك")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 30)
                
                Spacer()  // Pushes content to center

                // Balloons with Numbers in Center
                HStack(spacing: 40) {
                    ForEach(ages, id: \.self) { age in
                        
                        let destination = HomePage(child: Child(age: age, currentWordIndex: 0, currentLevelPrograss : 0), completedWords: $completedWords)
                        
                        NavigationLink(
                            destination: destination,
                            tag: age,
                            selection: $selectedAge
                        ) {
                            BalloonView(number: age, isSelected: selectedAge == age)
                                .onTapGesture {
                                    selectedAge = age  // Set the selected age
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()

                Spacer()  // Pushes content to center
            }
            .background(Color(red: 255/255, green: 249/255, blue: 219/255))
            .edgesIgnoringSafeArea(.all)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}


// Custom Balloon View
struct BalloonView: View {
    let number: Int
    var isSelected: Bool

    var body: some View {
        VStack {
            Circle()
                .fill(balloonColor(for: number))
                .frame(width: 100, height: 130)
                .overlay(
                    Text("\(number)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                )
                .scaleEffect(isSelected ? 2.6 : 1.8)  // Highlight selection
                .animation(.spring(), value: isSelected)

            // Balloon String
            Path { path in
                path.move(to: CGPoint(x: 80, y: 0))
                path.addQuadCurve(to: CGPoint(x: 50, y: 80), control: CGPoint(x: 30, y:30 ))
            }
            .stroke(Color.black, lineWidth: 10)
            .frame(height:150)
        }
    }

    private func balloonColor(for number: Int) -> Color {
        switch number {
        case 8: return Color.pink
        case 7: return Color.orange
        case 6: return Color.blue
        case 5: return Color.cyan
        default: return Color.gray
        }
    }
}

