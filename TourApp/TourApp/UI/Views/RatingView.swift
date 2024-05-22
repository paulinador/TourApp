//
//  RatingView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 10/04/2024.
//

import SwiftUI


struct RatingView: View {
    let rating: Double
    let maxRating: Double
    
    init(rating: Double, maxRating: Double) {
        self.rating = rating
        self.maxRating = maxRating
    }
    
    var body: some View {
        HStack {
            ForEach(1...Int(maxRating), id: \.self) { index in
                Image(systemName: index <= Int(self.rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .frame(width: 100, height: 30)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    RatingView(rating: 2, maxRating: 3)
}
