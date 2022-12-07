//
//  CafeShoppView.swift
//  CafeShopp
//
//  Created by Jundan Harish on 05/12/22.
//

import SwiftUI
import ActivityView

struct CafeShoppView: View {
    // MARK: - PROPERTIES
    @State var Cafe = CafeShop
    @State private var isLoading : Bool = true
    
    // MARK: - BODIES
    var body: some View {
        NavigationStack {
            List {
                ForEach(Cafe) { Coffeeshop in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: {
                            CafeShoppDetailView(CafeDetail: Coffeeshop)
                        }) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        CafeRow(Coffeeshop: Coffeeshop)
                    }
                }
                .onDelete { IndexSet in
                    Cafe.remove(atOffsets: IndexSet)
                }
                .redacted(reason: isLoading ? .placeholder : [] )
                .listRowSeparator(.hidden)
            }// List
            .refreshable {
                print("refresh content")
            }
            .onAppear {
                fetchData()
            }
            .listStyle(.plain)
            
        } //NavStack
    }
    // MARK: - FUNCTION
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

// MARK: - PREVIEW
struct CafeShoppView_Previews: PreviewProvider {
    static var previews: some View {
        CafeShoppView()
    }
}


// MARK: - SUBVIEW
struct CafeRow: View {
    @State var Coffeeshop: Coffeeshop
    @State private var item: ActivityItem?
    @State private var showAlert : Bool = false
    
    var body: some View {
        HStack (alignment: .top) {
            Image("\(Coffeeshop.image)")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(20)
            
            VStack (alignment: .leading) {
                Text("\(Coffeeshop.name)")
                    .font(.system(.title2, design:.rounded))
                    .fontWeight(.bold)
                
                Text("\(Coffeeshop.location)")
                    .font(.system(size: 15, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.top, 1)
                
                if Coffeeshop.isfavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .padding(.top,1)
                }
            } // VStack
            .padding(.leading, 10)
        } // HStack
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button{
                Coffeeshop.isfavorite.toggle()
            } label: {
                Image(systemName: "heart.fill")
            }
            .tint(.green)
            
            Button{
                item = ActivityItem(items: "\(Coffeeshop.name) in \(Coffeeshop.location) will be share !")
            } label: {
                Image(systemName: "square.and.arrow.up.fill")
            }
            .tint(.indigo)
        } // switchAction
        .contextMenu {
            Button {
                showAlert = true
            } label: {
                HStack {
                    Text("Pin this location")
                    Image(systemName: "pin")
                }
            }
            

            Button {
                Coffeeshop.isfavorite.toggle()
            } label: {
                HStack {
                    Text(Coffeeshop.isfavorite ? "Remove from favorite" : "Mark as favorite")
                    Image(systemName: Coffeeshop.isfavorite ? "heart.slash" : "heart")
                }
            }
            Button {
                item = ActivityItem(items: "\(Coffeeshop.name) in \(Coffeeshop.location) will be share !")
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        } // contextMenu
        .activitySheet($item)
        .alert("Not available yet", isPresented: $showAlert) {
            Button {} label: {
                Text("🆗 Buddy 👌🏻")
            }
        } message: {
            Text("This feature is not available yet 🙏🏻")
        }
    }
}
