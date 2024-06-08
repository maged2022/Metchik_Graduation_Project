import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarView(searchText: $viewModel.searchText, filterButtonClicked: {
                    viewModel.showFilterOptions = true
                })
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                        ForEach(viewModel.products) { product in
                            ProductItemView(
                                productItemViewModel: ProductItemViewModel(
                                    product: product,
                                    coordinator: viewModel.coordinator
                                ) { alertMessage in
                                    viewModel.showAlert = true
                                    viewModel.alertMessage = alertMessage
                                }
                            )
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
                    
                    FilterOptionsView(viewModel: viewModel)
                        .background(Color.black)
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
        .popup(isPresented: viewModel.showAlert, content: {
            SnackBar(type: .authError,
                     message: viewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                viewModel.showAlert = false
            }, onClickLogin: {
                viewModel.showAlert = false 
                viewModel.pressLoginButton()
            })
        })
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
    }
}
