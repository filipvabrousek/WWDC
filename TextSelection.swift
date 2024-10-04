//
//  HisFile.swift
//  TextEditor-2024
//
//  Created by Filip Vabroušek on 04.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @State private var text: String = "Hello World"
    @State private var selectedText = ""
    
    /// (Maybe) Due to a bug in the beta version of iOS 18 we cannot leave the selection uninitialised
    @State private var selection: TextSelection? = .init(insertionPoint: "".startIndex)
    
    // https://github.com/MatHeartGaming/coolStuff_with_SwiftUI/blob/2ffae6ad607c2dce62e813c465364aa0510a7a5f/iOS_18/Text%20Selection%20API/Text%20Selection%20API/ContentView.swift#L23
    // Thanks!!!
    var body: some View {
        NavigationStack {
            
            VStack {
                
                // First select the Text, then just click on "Selection is"
                TextEditor(text: $text, selection: $selection)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .frame(height: 150)
                    .background(.background, in: .rect(cornerRadius: 10))
                
                Text(selectedText)
                
                VStack  {
                    HStack {
                        
                        Button("Select Hello World") { // Click field first
                            if let range = text.range(of: "Hello") {
                                selection = .init(range: range)
                            }
                        }
                        
                        Button("Selection is"){
                            print(selection?.indices)
                          //  print(text[selection!])
                            
                            if let selection = selection?.indices, case .selection(let range) = selection {
                                let startIndex = range.lowerBound
                                let endIndex = range.upperBound

                                // Extract the selected text using the range
                                 selectedText = String(text[startIndex..<endIndex])

                                print("Selected text: \(selectedText)")
                                
                                
                            } else {
                                print("No selection found")
                            }
                        }
                        
                    } //: HSTACK
                    
                } //: VSTACK
                
                Spacer(minLength: 0)
                    
            } //: VSTACK
            .padding(15)
            .navigationTitle("Text Selection API")
            .background(.gray.opacity(0.1))
            /*.onChange(of: selection) { oldValue, newValue in
                if let selection = newValue, !selection.isInsertion {
                    print(selection.indices)
                    switch selection.indices {
                        case .selection(let range):
                        let selectedText = text[range]
                        print(selectedText)
                    
                    default:
                        print("Others")
                        
                    }
                }
            }*/
            
        } //: NAVIGATION
    }
    
    
    var selectedTextRange: Range<String.Index>? {
        if let selection, !selection.isInsertion {
            switch selection.indices {
            case .selection(let range): return range
                
            default: return nil
            }
        }
        return nil
    }
    
}
