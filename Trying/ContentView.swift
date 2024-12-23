////
////  ContentView.swift
////  Trying
////
////  Created by Alaa Emad Alhamzi on 21/06/1446 AH.
////
//
//import SwiftUI
//
///// Word Model
//struct Word: Identifiable {
//    let id = UUID()
//    let word: String
//    let imageName: String
//    let backgroundColor: String
//    var isCompleted: Bool
//}
//
//var words: [Word] = [
//    Word(word: "أرنب", imageName: "Rabbit", backgroundColor: "Pink", isCompleted: false),
//    Word(word: "حصان", imageName: "Horse", backgroundColor: "Brown", isCompleted: false),
//    Word(word: "بيت", imageName: "Home", backgroundColor: "Yellow", isCompleted: false)
//]
//
//struct HomePage: View {
//    
//    @State private var currentWordIndex = 0 // الكلمة الحالية
//    @State private var isActivityCompleted = false // حالة النشاط
//    @State private var completedWords: [Bool] = [false, false, false] // كلمات مكتملة
//
//    var body: some View {
//        
//        NavigationStack {
//            ZStack {
//                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
//
//                // Path between the homes
//                Image("Path")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 1500, height: 3300) // Adjust size to fit design
//                    .position(x: 700, y: 450)
//                
//                 
//                Button(action: {
//                                    
//                                     //add navigation
//                                }) {
//                                    Image("BigeHome")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 260, height: 260) // Adjust size to fit design
//                                } .position(x: 200, y: 150) // Adjust
//                
//                
//                NavigationLink{  FlashcardView(currentWordIndex:$currentWordIndex, isActivityCompleted:$isActivityCompleted, completedWords:$completedWords)
//                        .navigationBarBackButtonHidden(true)
//                    
//                } label: {
//                    Image("BrownHome")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350, height: 400) // Adjust size to fit design
//                    
//                }  .position(x: 900, y: 550) // Adjust coordinates to match layout
//                
//                
//                Image("character")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 517, height: 721) // Adjust size to fit design
//                    .position(x: 150, y: 700)
//            }
//        }
//    }
//}
//
//struct FlashcardView: View {
//    @Binding var currentWordIndex: Int // الكلمة الحالية
//    @Binding var isActivityCompleted: Bool // حالة النشاط
//    @Binding var completedWords: [Bool] // كلمات مكتملة
//
//    var body: some View {
//        
//        let word = words[currentWordIndex]
//
//        ZStack {
//            Color(word.backgroundColor).edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Image(word.imageName)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 300)
//
//                Text(word.word)
//                    .font(.largeTitle)
//                    .bold()
//                    .padding()
//                    .background(Color(word.backgroundColor))
//                    .cornerRadius(10)
//
//                NavigationLink(destination: PyramidView(currentWordIndex: $currentWordIndex, isActivityCompleted: $isActivityCompleted, completedWords: $completedWords)) {
//                    
//                    Text("التالي")
//                        .font(.headline)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
//    }
//}
//
//struct PyramidView: View {
//    
//    @Binding var currentWordIndex: Int // الكلمة الحالية
//    @Binding var isActivityCompleted: Bool // حالة النشاط
//    @Binding var completedWords: [Bool] // كلمات مكتملة
//    
//    @Environment(\.presentationMode) var presentationMode // للرجوع إلى الصفحة الرئيسية
//
//    var body: some View {
//        
//        let word = words[currentWordIndex]
//        let wordParts = splitWord(word.word) //This an array holds the word parts أ، أر، أرنـ، أرنب
//        
//
//        ZStack {
//            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Text("قسم الكلمة: \(word.word)")
//                    .font(.title)
//                    .bold()
//
//                VStack {
//                    
//                    ForEach(0..<wordParts.count, id: \.self) { index in
//                        
//                        VStack(spacing:53){
//                            
//                        ZStack {
//                            Image("part\(index + 1)")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 600, height: 100)
//                            
//                            HStack{
//                                
//                                
//                                
//                                Text(wordParts[index])
//                                    .font(.largeTitle)
//                                  
//                               
//                                
//                                Button(action: {
//                                    // تشغيل الصوت
//                                }) {
//                                    Image(systemName: "speaker.wave.2.fill")
//                                        
//                                        
//                                    
//                                }
//                                
//                                
//                            }
//                                
//                            
//                            
//                        }
//                    }
//                    }
//                    
//                    
//                }
//                .padding()
//
//                
//                
//                
//                NavigationLink(destination: DragAndDropPyramidView(currentWordIndex: $currentWordIndex, completedWords: $completedWords)) {
//                    
//                    Text("التالي")
//                        .font(.headline)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//
//                //                Button(action: {
////                    markWordAsCompleted()
////                    isActivityCompleted = true
////                    presentationMode.wrappedValue.dismiss() // الرجوع إلى الصفحة الرئيسية
////                }) {
////                    Text("إنهاء النشاط")
////                        .font(.headline)
////                        .padding()
////                        .background(Color.green)
////                        .foregroundColor(.white)
////                        .cornerRadius(10)
////                }
//            }
//            .padding()
//        }
//        .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
//    }
//
//    func splitWord(_ word: String) -> [String] {
//        
//        var parts: [String] = []
//        for i in 1...word.count {
//            let index = word.index(word.startIndex, offsetBy: i)
//            parts.append(String(word[word.startIndex..<index]))
//        }
//        return parts
//    }
//
////    func markWordAsCompleted() {
////        completedWords[currentWordIndex] = true
////        if currentWordIndex < words.count - 1 {
////            // البحث عن الكلمة التالية التي لم تكتمل بعد
////            for i in (currentWordIndex + 1)..<words.count {
////                if !completedWords[i] {
////                    currentWordIndex = i
////                    break
////                }
////            }
////        }
////    }
//}
//
//
//struct DragAndDropPyramidView: View {
//    @Binding var currentWordIndex: Int // الكلمة الحالية
//    @Binding var completedWords: [Bool] // كلمات مكتملة
//
//    @State private var droppedParts: [String?] = [nil, nil, nil, nil] // الأجزاء الموضوعة في أماكنها
//    @State private var isCorrect = false // هل الإجابة صحيحة؟
//
//    var wordParts: [String] {
//        let word = words[currentWordIndex]
//        return splitWord(word.word)
//    }
//
//    var body: some View {
//        ZStack {
//            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Text("اسحب الأجزاء إلى الأماكن الصحيحة")
//                    .font(.title)
//                    .bold()
//                    .padding()
//
//                // عرض الهرم الفارغ مع مناطق الإسقاط
//                VStack(spacing: 30) {
//                    ForEach(0..<4, id: \.self) { index in
//                        ZStack {
//                            Image("part\(index + 1)")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 600, height: 100)
//
//                            if let part = droppedParts[index] {
//                                Text(part)
//                                    .font(.largeTitle)
//                                    .foregroundColor(.black)
//                            } else {
//                                Text("مكان فارغ")
//                                    .font(.headline)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        .onDrop(of: [.text], isTargeted: nil) { providers in
//                            handleDrop(providers: providers, at: index)
//                        }
//                    }
//                }
//                .padding()
//
//                // عرض مربعات الأجزاء
//                HStack {
//                    Spacer()
//                    VStack(spacing: 20) {
//                        ForEach(wordParts, id: \.self) { part in
//                            DraggablePart(part: part)
//                        }
//                    }
//                }
//
//                Button(action: checkAnswer) {
//                    Text("تحقق")
//                        .font(.headline)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//                .alert(isPresented: $isCorrect) {
//                    Alert(
//                        title: Text(isCorrect ? "رائع!" : "حاول مرة أخرى"),
//                        message: Text(isCorrect ? "أحسنت! الكلمة صحيحة." : "ترتيب الكلمة غير صحيح."),
//                        dismissButton: .default(Text("متابعة"))
//                    )
//                }
//            }
//            .padding()
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//
//    func splitWord(_ word: String) -> [String] {
//        var parts: [String] = []
//        for i in 1...word.count {
//            let index = word.index(word.startIndex, offsetBy: i)
//            parts.append(String(word[word.startIndex..<index]))
//        }
//        return parts
//    }
//
//    func handleDrop(providers: [NSItemProvider], at index: Int) -> Bool {
//        if let provider = providers.first(where: { $0.canLoadObject(ofClass: String.self) }) {
//            _ = provider.loadObject(ofClass: String.self) { item, _ in
//                if let text = item as? String {
//                    DispatchQueue.main.async {
//                        droppedParts[index] = text
//                    }
//                }
//            }
//            return true
//        }
//        return false
//    }
//
//    func checkAnswer() {
//        isCorrect = droppedParts.compactMap { $0 } == wordParts
//    }
//}
//
//struct DraggablePart: View {
//    let part: String
//
//    var body: some View {
//        Text(part)
//            .font(.headline)
//            .padding()
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 5)
//            .onDrag {
//                NSItemProvider(object: part as NSString)
//            }
//    }
//}
//
//
//
//#Preview {
//    HomePage()
//}

import SwiftUI

/// Word Model
struct Word: Identifiable {
    let id = UUID()
    let word: String
    let imageName: String
    let backgroundColor: String
    var isCompleted: Bool
}

var words: [Word] = [
    Word(word: "أرنب", imageName: "Rabbit", backgroundColor: "Pink", isCompleted: false),
    Word(word: "حصان", imageName: "Horse", backgroundColor: "Brown", isCompleted: false),
    Word(word: "بيت", imageName: "Home", backgroundColor: "Yellow", isCompleted: false)
]

struct HomePage: View {
    
    @AppStorage("currentWordIndex") private var currentWordIndex = 0
    //@State private var currentWordIndex = 0
    @State private var isActivityCompleted = false
    @State private var completedWords: [Bool] = [false, false, false]

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)

                // Path between the homes
                Image("Path")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1500, height: 3300)
                    .position(x: 700, y: 450)
                
                Button(action: {
                    // Action for big home
                }) {
                    Image("BigeHome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 260)
                }
                .position(x: 200, y: 150)
                
                NavigationLink(destination: FlashcardView(
                    currentWordIndex: $currentWordIndex,
                    isActivityCompleted: $isActivityCompleted,
                    completedWords: $completedWords
                )) {
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

struct FlashcardView: View {
    @Binding var currentWordIndex: Int
    @Binding var isActivityCompleted: Bool
    @Binding var completedWords: [Bool]

    var body: some View {
        let word = words[currentWordIndex]

        ZStack {
            Color(word.backgroundColor).edgesIgnoringSafeArea(.all)

            VStack {
                Image(word.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)

                Text(word.word)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .background(Color(word.backgroundColor))
                    .cornerRadius(10)

                NavigationLink(destination: PyramidView(
                    currentWordIndex: $currentWordIndex,
                    isActivityCompleted: $isActivityCompleted,
                    completedWords: $completedWords
                )) {
                    Text("التالي")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PyramidView: View {
    @Binding var currentWordIndex: Int
    @Binding var isActivityCompleted: Bool
    @Binding var completedWords: [Bool]

    var body: some View {
        let word = words[currentWordIndex]
        let wordParts = splitWord(word.word)

        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)

            VStack {
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
                    currentWordIndex: $currentWordIndex,
                    completedWords: $completedWords
                )) {
                    Text("التالي")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
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

struct DragAndDropPyramidView: View {
    @Binding var currentWordIndex: Int
    @Binding var completedWords: [Bool]

    @State private var droppedParts: [String?] = [nil, nil, nil, nil]
    @State private var isPartCorrect: [Bool] = [false, false, false, false]

    var wordParts: [String] {
        let word = words[currentWordIndex]
        return splitWord(word.word)
    }

    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)

            VStack {
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
                                        .foregroundColor(isPartCorrect[index] ? .green : .red)
                                }
                            }
                            .onDrop(of: [.text], isTargeted: nil) { providers in
                                handleDrop(providers: providers, at: index)
                            }
                        }
                    }

                    
                    VStack {
                        ForEach(wordParts, id: \.self) { part in
                            if !droppedParts.contains(part) {
                                DraggablePart(part: part)
                            }
                        }
                    }
                    
                }
                
              

                //Check if all wordparts are placed in the correct place display the arrow and navigate the child to the home page
                
                if isPartCorrect.allSatisfy({ $0 }) {
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "arrow.backward.circle")
                            .resizable()
                            .foregroundStyle(Color.orange)
                            .frame(width: 78, height: 78)
                    }
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
        Text(part)
            .font(.headline)
            .padding()
            .background(Color("StickyNoteColor"))
            .cornerRadius(10)
            .onDrag {
                NSItemProvider(object: part as NSString)
            }
    }
}

#Preview {
    HomePage()
}
