//
//  FilterView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/9/25.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedStatus: ReadingStatus?
    @State var workingSelectedStatus: ReadingStatus?
    @State var workingSelectedGenre: Genre?

    @Environment(\.dismiss) var dismiss
    

    init(selectedGenre: Binding<Genre?>, selectedStatus: Binding<ReadingStatus?>){
        self._selectedGenre = selectedGenre
        self._workingSelectedGenre = .init(initialValue: selectedGenre.wrappedValue)
        
        self._selectedStatus = selectedStatus
        self._workingSelectedStatus = .init(initialValue: selectedStatus.wrappedValue)
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Filter by genre")){
                    Picker("Genre", selection: $selectedGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id:\.self) {
                            genre in Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                
                Section(header:Text("Filter by status")){
                    Picker("Status", selection: $selectedStatus){
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
                        selectedGenre = workingSelectedGenre
                        selectedStatus = workingSelectedStatus
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Clear"){
                        selectedGenre = nil
                        selectedStatus = nil
                        dismiss()
                    }
                }
            }
        }
    }
}
