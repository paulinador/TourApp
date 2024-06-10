//
//  SearchView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @State private var isSorted = false
    
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
        .onSubmit {
            viewModel.searchCity()
        }
    }
    
    @ViewBuilder private func makeSuccessStateView() -> some View {
        VStack {
            makeHeader()
            
            makeSearchField()
            
            makeGeoInfo()
            
            makeSortingButton()
            
            makeList()
        }
        .background(.darkGreen)
    }
    
    @ViewBuilder private func makeHeader() -> some View {
        HStack {
            Text("Let's go on a tour!")
            Image(systemName: "map.fill")
        }
        .font(.title)
        .foregroundStyle(.lightGreen)
        .padding()
    }

    @ViewBuilder private func makeList() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.objectData, id: \.self) { item in
                    NavigationLink {
                        TourDetailView(viewModel: TourDetailViewModel(
                            downloader: DetailsRepository(apiClient: DefaultAPIClient()),
                            xid: item.properties.xid,
                            favoriteObjectRepository: FavoriteObjectRepository(),
                            properties: item.properties))
                    } label: {
                        VStack(alignment: .center) {
                            Text(item.properties.name)
                                .padding(.bottom, 5)
                                .font(.callout)
                                .foregroundStyle(.darkGreen)

                            RatingView(rating: Double(item.properties.rateEdit), maxRating: 3)
                        }
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width * 0.85)
                        .padding(.horizontal)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    @ViewBuilder private func makeSearchField() -> some View {
        HStack(alignment: .center) {
            TextField("Enter a city name", text: $viewModel.searchName) {
                viewModel.searchCity()
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .multilineTextAlignment(.center)
            .padding(.leading)
            .padding(.bottom)
            
            Button {
                viewModel.searchCity()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(viewModel.hasValidCityName ? .lightGreen : .gray.opacity(0.1))
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .padding(.bottom)
            }
            .disabled(viewModel.hasValidCityName == false)
            .padding(.trailing)
        }
    }
    
    @ViewBuilder private func makeGeoInfo() -> some View {
        Text(viewModel.name.capitalized + " " + "(\(viewModel.country))")
            .padding(.bottom, 15)
            .font(.title2)
            .fontWeight(.light)
            .foregroundStyle(.lightGreen)
    }
    
    @ViewBuilder private func makeSortingButton() -> some View {
        Button {
            if isSorted {
                viewModel.sortByDefault()
                isSorted = false
            } else {
                viewModel.sortByTopRating()
                isSorted = true
            }
        } label: {
            if isSorted {
                Text("\(Image(systemName: "trash.fill")) Cancel")
                    .foregroundStyle(.darkRed)
                    .font(.subheadline)
            } else {
                Text("\(Image(systemName: "line.3.horizontal.decrease.circle.fill")) Sort by Top Rate")
                    .foregroundStyle(.yellow)
                    .font(.subheadline)
            }
        }
        .padding(.vertical)
        .frame(width: isSorted ? 100 : 150, height: 24)
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(cornerRadius: 5))
        .padding(.bottom)
    }
    
    @ViewBuilder private func makeErrorStateView() -> some View {
        VStack {
            Text("Error")
                .font(.headline)
                .padding()
            
            Button("Maybe try again?") {
                Task {
                    await viewModel.fetchData()
                }
            }
            .buttonStyle(.bordered)
        }
        .foregroundStyle(.darkGreen)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightBackground)
    }
}
