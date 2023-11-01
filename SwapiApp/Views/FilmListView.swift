//
//  FilmListView.swift
//  SwapiApp
//
//  Created by Jinal Shah on 01/11/23.
//

import SwiftUI
import SwaAPI

struct FilmListView: View {
    //MARK: - Variables
    @EnvironmentObject var router: UIPilot<AppRoute>
    @State var arrFilmList: [SwaAPI.GetFilmListQuery.Data.AllFilms.Film] = []
    @State private var searchText = ""
    
    //Filter Films
    var filteredFilms: [SwaAPI.GetFilmListQuery.Data.AllFilms.Film] {
        if searchText.isEmpty {
            return arrFilmList
        } else {
            return arrFilmList.filter { movie in
                return movie.title!.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    //Setup SearchView
                    SearchBarView(strSearch: $searchText)
                    
                    List(filteredFilms, id: \.id) { film in
                        VStack {
                            ListRowView(film: film)
                                .frame(height: 50)
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                        }
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            router.push(.filmDetails(film))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
                    .onAppear {
                        Network.shared.apollo.fetch(query: GetFilmListQuery()) { result in
                            switch result {
                            case .success(let graphQLResult):
                                
                                if let countries = graphQLResult.data?.allFilms?.films {
                                    self.arrFilmList = countries.compactMap { $0 }
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
