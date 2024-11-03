import SwiftUI

struct URLImageView: View {
    let imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView() // Loading indicator
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures progress view fills container
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Makes image fill the container and crop excess
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Occupies full container size
                    .clipped() // Crops overflowing parts
            case .failure:
                Image(systemName: "photo") // Placeholder on failure
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.gray)
                    .clipped()
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures container takes full available space
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(imageURL: URL(string: "https://example.com/image.jpg")!)
            .frame(width: 300, height: 200) // Test with specific container size
    }
}
