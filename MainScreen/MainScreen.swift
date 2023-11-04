import SwiftUI
import Alamofire
import Kingfisher

struct MainScreen: View {

    @State private var spaces: [SpaceModel] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(spaces, id: \.id) { space in
                    VStack(alignment: .leading, spacing: 8) {
                        KFImage(URL(string: space.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 230) // Resim boyutunu büyüt
                            .cornerRadius(20) // Kenarlara yuvarlaklık ekleyin
                            .onTapGesture {
                                if let url = URL(string: space.url) {
                                    UIApplication.shared.open(url)
                                }
                            }
                          
                                Text(space.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(10)
                                   // .offset(y: -25) // Resim üzerine yazıyı yerleştirin
                          
                        
                        Text(space.summary)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(8)
                    Divider()
                }
            }
            .navigationBarTitle("Uzay Haberleri")
            .onAppear(perform: fetchSpaces)
        }
    }
    
    func fetchSpaces() {
        let request = AF.request("https://api.spaceflightnewsapi.net/v3/articles")
        
        request.responseDecodable(of: [SpaceModel].self) { response in
            switch response.result {
            case .success(let fetchedSpaces):
                self.spaces = fetchedSpaces
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

