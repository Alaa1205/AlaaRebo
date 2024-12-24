//
//  Prograss Bar View.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

struct ProgressBarView: View {
    //var currentLevel: Int // Indicates the user's progress (1 = first pumpkin, 2 = second pumpkin, etc.)

    @ObservedObject var child: Child
    
    var body: some View {
        ZStack(alignment: .trailing) { // Align everything to the trailing edge (right side)
            // Background gray bar
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 400, height: 30)
                .cornerRadius(55)
            
            if child.currentLevelPrograss == 0{
                 //Orange progress bar filling from the right
                                           Rectangle()
                                    .fill(Color("PrograssBarColor"))
                                    .frame(width: CGFloat(child.currentLevelPrograss) * 75, height: 30)
                                               .cornerRadius(55)
                                               .animation(.easeInOut, value: child.currentLevelPrograss)
            }
//            if currentLevel == 2{
//                // Orange progress bar filling from the right
//                           Rectangle()
//                    .fill(Color("PrograssBarColor"))
//                               .frame(width: CGFloat(currentLevel) * 75, height: 30)
//                               .cornerRadius(55)
//                               .animation(.easeInOut, value: currentLevel)
//            }
           

            // Pumpkins overlay
            HStack(spacing: 75) {
                ForEach(0..<4) { index in
                    
                            Image("pumpkin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 55)
                        
                }
                
            }.padding(.horizontal,-15)
        }
        .frame(width: 400, alignment: .trailing) // Ensure the progress bar aligns to the right
    }
}

