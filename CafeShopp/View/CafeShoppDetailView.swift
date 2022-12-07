//
//  CafeShoppDetailView.swift
//  CafeShopp
//
//  Created by Jundan Harish on 07/12/22.
//

import SwiftUI

struct CafeShoppDetailView: View {
    // MARK: - PROPERTIES
    @State var CafeDetail : Coffeeshop
    // MARK: - BODIES
    var body: some View {
        ZStack(alignment: .center) {
            Image(CafeDetail.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("\(CafeDetail.name)")
                Text("\(CafeDetail.location)")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .font(.system(.title, design: .rounded))
            .fontWeight(.semibold)
            .frame(width: 350)
            .foregroundColor(.white)
            .background(.opacity(0.7))
            .cornerRadius(20)
        }
    }
}

struct CafeShoppDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CafeShoppDetailView(
            CafeDetail: Coffeeshop(
                image: "bojaeatery",
                name: "Boja Eatery",
                location: "Jl. Sumatera No. 21, Kota Bandung",
                review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class",
                isfavorite: false)
        )
    }
}
