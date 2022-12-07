//
//  ContentView.swift
//  CafeShopp
//
//  Created by Jundan Harish on 05/12/22.
//

import SwiftUI



struct MainView: View {
    // MARK: - PROPERTIES
//    @State private var selection: Int = 0
    @State private var selectedtab: Tabs = .coffeshop
    
    // MARK: - BODIES
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedtab) {
                    CafeShoppView()
                        .listStyle(.plain)
                        .tabItem{
                            Image(systemName: "square.grid.2x2")
                            Text("Browse")
                        }
                        .tag(Tabs.coffeshop)
                    
                    VStack {
                        Text("watch".uppercased())
                            .font(.system(.largeTitle, design: .rounded))
                        Button {
                            selectedtab = Tabs.profile
                        } label: {
                            Text("Show Profile")
                                .font(.system(.headline, design: .rounded))
                                .padding()
                                .foregroundColor(.white)
                                .background(.indigo)
                                .cornerRadius(10)
                                .padding()
                        }
                    } //VStack
                    .tabItem{
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                    .tag(Tabs.watch)
                    
                    Text("loans".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .tabItem{
                            Image(systemName: "rectangle.and.text.magnifyingglass")
                            Text("Loans")
                        }
                        .tag(Tabs.loans)
                    
                    Text("profile".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .tabItem{
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(Tabs.profile)
                } //TabView
            .tint(.purple)
            .navigationTitle(selectedtab.rawValue.capitalized)
        } //Nav Stack
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Tabs: String {
    case coffeshop
    case watch
    case loans
    case profile
}
