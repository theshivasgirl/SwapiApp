//
//  SwapiAppApp.swift
//  SwapiApp
//
//  Created by Jinal Shah on 01/11/23.
//

import SwiftUI

@main
struct SwapiAppApp: App {
    @StateObject var pilot = UIPilot(initial: AppRoute.home)

    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot)  { route in
                switch route {
                case .home: ContentView()
                case .filmDetails(let objFilm): FilmDetailsView(objFilm: objFilm!)
                }
            }
        }
    }
}
