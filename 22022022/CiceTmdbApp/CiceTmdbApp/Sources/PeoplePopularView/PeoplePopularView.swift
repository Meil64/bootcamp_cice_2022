import SwiftUI

struct PeoplePopularView: View {
    
    @StateObject var viewModel = PeoplePopularViewModel()
    
    var body: some View {
        ScrollView{
            if !self.viewModel.dataPeople.isEmpty {
                PeopleCarousel(title: "",
                               dataModel: self.viewModel.dataPeople)
            }
        }
        .navigationTitle("Popular People")
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct PeoplePopularView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplePopularView()
    }
}
