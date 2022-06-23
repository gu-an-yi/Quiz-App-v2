//
//  ContentView.swift
//  Quiz App v2
//
//  Created by Lee Guan Yi on 23/6/22.
//

import SwiftUI

struct ContentView: View {
    
    let questions = [
        QuizQuestion(title: "What is the day today?", option1: "Monday", option2: "Tuesday", option3: "Wednesday", option4: "Thursday"),
        QuizQuestion(title: "Who is your instructor", option1: "ZJ", option2: "XZ", option3: "AB", option4: "YJ"),
        QuizQuestion(title: "Where are we having lessons?", option1: "Banana", option2: "Orange", option3: "Pineapple", option4: "Apple")
    ]
    
    @State var questionIndex = 0
    @State var isAlertShown = false
    @State var isCorrect = true
    @State var score = 0
    @State var isSheetShown = false
    @State private var progress = 0.0
    
    @Environment(\.colorScheme) var ColorScheme:ColorScheme
    
    fileprivate func QuizButton(_ label: String, color: Color) -> some View {
        Text(label)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    var body: some View {
        VStack {
            ProgressView(value: progress)
                         Button("Progress Bar", action: { progress += 0 })
                             .foregroundColor(.red)
                             .font(.largeTitle)

            Text(questions[questionIndex].title)
                .padding(40)
            HStack {
                HStack {
                    
                    HStack {
                        
                        
                        
                        Image(systemName: "triangle")
                        
                        Button {
                            isAlertShown = true
                            isCorrect = false
                            progress += 0.333333333333
                        } label: {
                            QuizButton(questions[questionIndex].option1, color: .red)
                            
                        }
                        
                        
                    }
                    .background(Color.red)
                }
                
                
                HStack {
                    
                    HStack {
                        Image(systemName: "diamond")
                        Button {
                            isAlertShown = true
                            isCorrect = false
                            progress += 0.333333333333
                        } label: {
                            QuizButton(questions[questionIndex].option2, color: .teal)
                        }
                    }
                    .background(Color.teal)
                }
            }
            HStack {
                
                HStack {
                    HStack {
                        
                        
                        
                        Image(systemName: "circle")
                        Button {
                            isAlertShown = true
                            isCorrect = false
                            progress += 0.333333333333
                        } label: {
                            QuizButton(questions[questionIndex].option3, color: .green)
                        }
                    }
                    .background(Color.green)
                }
                HStack {
                    HStack {
                        HStack {
                            Image(systemName: "square")
                            Button {
                                isAlertShown = true
                                isCorrect = true
                                progress += 0.333333333333
                                score += 1
                            } label: {
                                QuizButton(questions[questionIndex].option4, color: .yellow)
                            }
                        }
                        .background(Color.yellow)
                    }
                }
            }
        }
        .background(ColorScheme == .dark ? .black : .white)
        .alert(isCorrect ? "Well done!" : "You're bad",
               isPresented: $isAlertShown) {
            Button("OK") {
                if questionIndex == questions.count - 1 {
                    isSheetShown = true
                } else {
                    questionIndex += 1
                }
            }
        }
               .sheet(isPresented: $isSheetShown) {
                   Text("Your score is \(score)/\(questions.count)")
               }
               .sheet(isPresented: $isSheetShown) {
                                   Text("Your score is \(score)/\(questions.count)")
                               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
