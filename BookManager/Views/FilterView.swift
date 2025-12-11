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
                        dismiss()
                    }
                }
            }
        }
    }
}
