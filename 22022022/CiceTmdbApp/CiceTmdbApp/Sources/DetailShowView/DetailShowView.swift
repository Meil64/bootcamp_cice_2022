import SwiftUI

struct DetailShowView: View {
    
    @StateObject var viewModel = DetailShowViewModel()
    
    var body: some View {
        VStack {
            Text("Hello DetailShowView")
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct DetailShowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailShowView()
    }
}
