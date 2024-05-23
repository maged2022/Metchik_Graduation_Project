import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarView(searchText: $viewModel.searchText, filterButtonClicked: {
                    viewModel.showFilterViewOptions()
                })
                .padding()
                
                // Grid layout to display products
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                        ForEach(viewModel.products) { product in
                            ProductItemView(productItemViewModel: ProductItemViewModel(product: product, coordinator: viewModel.coordinator))
                        }
                    }
                    .padding(.top, 6)
                }
            }
            
            if viewModel.showFilterOptions {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        viewModel.showFilterOptions = false
                    }
                
                VStack {
                    Spacer().frame(height: 70)
                    
                    filterViewOptions(viewModel: viewModel)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.trailing,5)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

struct filterViewOptions: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Price Filter") {
                viewModel.applyPriceFilter()
            }
            Button("Other Filter") {
                viewModel.showFilterView()
            }
            Button("Cancel") {
                viewModel.showFilterOptions = false
            }
        }
        .padding()
    }
}
