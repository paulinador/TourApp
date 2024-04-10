//
//  SearchView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
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
//        .searchable(text: $viewModel.searchName)
//        .onSubmit(of: .search) {
//            viewModel.onSearchTap()
//        }
    }
    
    @ViewBuilder private func makeSuccessStateView() -> some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(red: 222 / 255, green: 192 / 255, blue: 241 / 255),
                                        Color(red: 239 / 255, green: 217 / 255, blue: 206 / 255)
                                       ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text("Let's go on a tour!")
                        .font(.title)
                        .foregroundStyle(Color(red: 113 / 255, green: 97 / 255, blue: 239 / 255))
                        .padding()
                    
                    HStack {
                        TextField("Enter a city name", text: $viewModel.searchName)
                        {
                            Task {
                                await viewModel.searchCity()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        .padding(.bottom)
                        
                        Button {
                            Task {
                                await viewModel.searchCity()
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.trailing)
                        
                    }
                    
                    Text(viewModel.name.capitalized)
                    Text(viewModel.country)
                    
                    List(viewModel.objectData, id:\.self) { item in
                        NavigationLink {
                            TourDetailView(viewModel: TourDetailViewModel(
                                downloader: DetailsRepository(apiClient: DefaultAPIClient()),
                                xid: item.properties.xid,
                                favoriteObjectRepository: FavoriteObjectRepository(),
                                properties: item.properties)
                            )
                        } label: {
                            VStack(alignment: .leading) {
                                Text(item.properties.name)
                                    .padding(.bottom, 5)

                                RatingView(rating: Double(item.properties.rateEdit), maxRating: 3)
                            }
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
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
        }
    }
}
