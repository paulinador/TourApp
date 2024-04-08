//
//  TourDetailView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import SwiftUI

struct TourDetailView: View {
    @StateObject var viewModel: TourDetailViewModel
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success:
                makeSuccessStateView()
            case.error:
                makeErrorStateView()
            }
        }
    }
    
    @ViewBuilder private func makeSuccessStateView() -> some View {
        VStack {
            Text(viewModel.name)
                .font(.title)
                .padding()
            
            VStack{
                Text(viewModel.country)
                    .font(.headline)
                Text(viewModel.city)
                    .font(.headline)
                    .fontWeight(.light)
            }
            .padding(.bottom)
            
            Text(viewModel.wikiInfo)
                .font(.caption)
            
            Spacer()
            
            AsyncImage(url: URL(string: viewModel.imageSource)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder private func makeErrorStateView() -> some View {
        VStack {
            Text("Error")
                .font(.headline)
                .padding()
            
            Button("Maybe try again?") {
                Task {
                    await viewModel.fetchDetails(xid: viewModel.xid)
                }
            }
        }
    }
}



