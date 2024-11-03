import SwiftUI
import CoreData

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State var selectedMerchant: Merchant? = nil
    
    var body: some View {
        ZStack {
            Color.appBackgroundColor.ignoresSafeArea() // Apply background color
            if homeViewModel.isLoading {
                ProgressView("Loading merchants...")
                    .foregroundColor(.black)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        SearchBar()
                            .padding(.horizontal)
                            .padding(.vertical, 7)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                QuickSearchIcon(text: "Near me")
                                QuickSearchIcon(text: "$$$$")
                                QuickSearchIcon(text: "Going Fast")
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 7)
                        }
                        
                        MerchantCarousel(text: "Have you seen these?", merchants: homeViewModel.merchants)
                        MerchantCarousel(text: "Recently Added", merchants: homeViewModel.merchants)
                        MerchantCarousel(text: "Fancy something sweet?", merchants: homeViewModel.merchants)
                        Spacer()
                    }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .padding(.top)
        .ignoresSafeArea()
        .fullScreenCover(item: $homeViewModel.selectedMerchant) { merchant in
            MerchantCard(merchant: merchant, menuItems: homeViewModel.merchantItems) {
                homeViewModel.clearSelectedMerchant()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let homeViewModel = HomeViewModel()
        HomeView().environmentObject(homeViewModel)
    }
}
