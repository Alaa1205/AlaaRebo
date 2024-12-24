//
//  Sand.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 23/06/1446 AH.
//

import SwiftUI

// MARK: - Model
struct SandDrawPoint: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var isEraser: Bool
}

// MARK: - ViewModel
class SandDrawViewModel: ObservableObject {
    @Published var points: [SandDrawPoint] = []
    @Published var isEraser: Bool = false

    func addPoint(_ point: SandDrawPoint) {
        points.append(point)
    }

    func clearCanvas() {
        points.removeAll()
    }
}

// MARK: - ProgressBarView
struct progressBarView: View {
    var currentLevel: Int

    var body: some View {
        ZStack(alignment: .trailing) {
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 400, height: 30)
                .cornerRadius(55)

            Rectangle()
                .fill(Color("Bar"))
                .frame(width: CGFloat(currentLevel) * 75, height: 30)
                .cornerRadius(55)
                .animation(.easeInOut, value: currentLevel)

            HStack(spacing: 75) {
                ForEach(0..<4) { _ in
                    Image("pumpkin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 55)
                }
            }
            .padding(.horizontal, -15)
        }
        .frame(width: 400, alignment: .trailing)
    }
}

// MARK: - SandDrawView
struct SandDrawView: View {
    @StateObject private var viewModel = SandDrawViewModel()
    @State private var showPopup = false // State to toggle the pop-up
    @ObservedObject var child : Child
    @Binding var completedWords: [Bool]
    @State private var navigateToHomePage = false  // Flag to trigger navigation
    
    var body: some View {
        
        let word = words[child.currentWordIndex]
        
        VStack(spacing: 20) {
            // Progress Bar
            ProgressBarView(child:child)
            
            HStack {
                // Undo/Delete Button in Circle (on the left)
                Button(action: {
                    viewModel.clearCanvas()
                }) {
                    Image(systemName: "trash.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.yellow))
                }

                Spacer()

                // Home Button in Circle (on the right)
                Button(action: {
                    // Add your action for home button
                }) {
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.yellow))
                }
            }
            .padding(.horizontal)

            // Text below the progress bar
            Text(word.word)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)

            // Drawing Rectangle with background image "sand_texture"
            ZStack {
                Image("sand")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 952, height: 476)
                    .cornerRadius(15)
                    .shadow(radius: 5)

                Canvas { context, size in
                    for point in viewModel.points {
                        let baseColor = point.isEraser ? Color("background") : Color(red: 0.76, green: 0.58, blue: 0.37)
                        
                        let shadowColor = Color.black.opacity(0.7)
                        let shadowOffset = CGSize(width: 2, height: 2)
                        let shadowRect = CGRect(x: point.x - 6 + shadowOffset.width, y: point.y - 6 + shadowOffset.height, width: 14, height: 14)
                        context.fill(Path(ellipseIn: shadowRect), with: .color(shadowColor))

                        let rect = CGRect(x: point.x - 6, y: point.y - 6, width: 14, height: 14)
                        context.fill(Path(ellipseIn: rect), with: .color(baseColor))
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let newPoint = SandDrawPoint(
                                x: value.location.x,
                                y: value.location.y,
                                isEraser: viewModel.isEraser
                            )
                            viewModel.addPoint(newPoint)
                        }
                )
            }
            .frame(width: 952, height: 476)

            // Check mark button under the drawing rectangle
            Button(action: {
                showPopup = true // Show the pop-up
            }) {
                Image(systemName: "checkmark")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.yellow))
            }
            .padding(.top, 20)
        }
        
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all)) // Background color for the entire UI

        // Pop-up implementation
        .overlay(
            Group {
                if showPopup {
                    ZStack {
                        // Background overlay
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)

                        // Pop-up rectangle
                        VStack(spacing: 10){
                            
                            //ProgressBarView(child: child)
                            Text("مبروك!🎉 لقد تم إنهاء كلمة (\(word.word))")
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color(.black))
                            
                            
                            
                           Image("SingleCharacter")
                                .resizable()
                                .scaledToFit()
                               // .frame(width: 100, height: 300)
                                //.position(x: 150, y: 700)
                            
                            Button(action: {
                                // Call the function before navigating
                                 markWordAsCompleted()
                                navigateToHomePage = true
                    
                            
                                                }) {
                                                    Text("الصفحة الرئيسية")
                                                        .padding()
                                                        .font(.title2)
                                                        .foregroundStyle(Color(.black))
                                                        .frame(width: 200, height: 70)
                                                        .background(Color("StichyNotes Rectangle"))
                                                        .cornerRadius(20)
                                                }
                                                .background(
                                                    NavigationLink(
                                                        destination: HomePage(child: child),
                                                        isActive: $navigateToHomePage,
                                                        label: { EmptyView() }
                                                    )
                                                )
                            
                            
                                                
//
                        }.padding()
                        .frame(width: 644, height: 394)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
//                        .overlay(
//                            
//                            
//                           
//                           
//                            
//                        )
                            
                    }
                }
            }
        )
        
        .navigationBarBackButtonHidden(true)
    }
    
    func markWordAsCompleted() {
        
        var word  = words[child.currentWordIndex]
        word.isCompleted = true
        
        
        completedWords[child.currentWordIndex] = true
        
//        if child.currentWordIndex < words.count - 1 {
//                // البحث عن الكلمة التالية التي لم تكتمل بعد
//            for i in (child.currentWordIndex + 1)..<words.count {
//                    if !completedWords[i] {
//                        child.currentWordIndex = i
//
//                    }else{
//                        child.currentWordIndex += 1
//                    }
//                }
//            }
        
        if   child.currentWordIndex < words.count - 1  {
            
            child.currentWordIndex += 1
            
            
        }else{
            child.currentWordIndex = 0
        }
    
        }
    
    
}

//// MARK: - Preview
//struct SandDrawView_Previews: PreviewProvider {
//    static var previews: some View {
//        SandDrawView()
//    }
//}
