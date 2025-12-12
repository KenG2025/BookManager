//
//  FilterView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/9/25.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selecttedGenre: Genre?
    @Binding var selecttedStatus: ReadingStatus?
    @State var workingSelectedStatus: ReadingStatus?
    @State var workingSelectedGenre: Genre?

    @Environment(\.dismiss) var dismiss
    

    init(selecttedGenre: Binding<Genre?>, selecttedStatus: Binding<ReadingStatus?>){
        self._selecttedGenre = selecttedGenre
        self._workingSelectedGenre = .init(initialValue: selecttedGenre.wrappedValue)
        
        self._selecttedStatus = selecttedStatus
        self._workingSelectedStatus = .init(initialValue: selecttedStatus.wrappedValue)
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Filter by genre")){
                    Picker("Genre", selection: $selecttedGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id:\.self) {
                            genre in Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                
                Section(header:Text("Filter by status")){
                    Picker("Status", selection: $selecttedStatus){
                        Text("Select a status...").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id:\.self) {
                            status in Text(status.rawValue).tag(status)
                        }
                    }
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Apply"){
                        selecttedGenre = workingSelectedGenre
                        selecttedStatus = workingSelectedStatus
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Clear"){
                        selecttedGenre = nil
                        selecttedStatus = nil
                        dismiss()
                    }
                }
            }
        }
    }
}
