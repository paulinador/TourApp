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
        .task {
            await viewModel.fetchDetails(xid: viewModel.xid)
        }
    }
    
    @ViewBuilder private func makeSuccessStateView() -> some View {
        NavigationStack {
            VStack {
                makeHeader()
                
                HStack {
                    makeImage()
                    
                    VStack {
                        makeGeoInfo()
                        
                        makeButton()
                    }
                    .padding(.horizontal)
                }
                
                makeStroke()
                
                makeDescription()
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.lightBackground)
        }
    }
    
    @ViewBuilder private func makeStroke() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.darkGreen)
            .padding(.vertical)
    }
    
    @ViewBuilder private func makeHeader() -> some View {
        Text(viewModel.name)
            .font(.headline)
            .foregroundStyle(.darkGreen)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.bottom, 10)
    }
    
    @ViewBuilder private func makeImage() -> some View {
        AsyncImage(url: URL(string: viewModel.imageSource)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
//                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder private func makeButton() -> some View {
        Button {
            viewModel.addFavorites()
        } label: {
            if viewModel.isFavorite() {
                Image(systemName: "heart.fill")
            } else {
                Image(systemName: "heart")
            }
        }
        .buttonStyle(.bordered)
        .padding(.top, 10)
    }
    
    @ViewBuilder private func makeGeoInfo() -> some View {
        VStack {
            Text(viewModel.city)
                .font(.caption).bold()
            Text(viewModel.country)
                .font(.caption)
        }
        .foregroundStyle(.darkGreen)
    }
    
    @ViewBuilder private func makeDescription() -> some View {
        Text(viewModel.wikiInfo)
            .font(.callout)
            .foregroundStyle(.darkGreen)
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
            .buttonStyle(.bordered)
        }
        .foregroundStyle(.darkGreen)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightBackground)
    }
}



