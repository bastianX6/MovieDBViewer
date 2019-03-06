import SDWebImage
import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet var imageViewPoster: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelReleaseDate: UILabel!
    @IBOutlet var textViewOverview: UITextView!

    var movie: MovieModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        guard let movie = self.movie else { return }
        labelTitle.text = movie.title
        labelReleaseDate.text = movie.humanDate
        textViewOverview.text = movie.overview
        if let imgEndpoint = Configurations.shared.movieDbImgEndpoint, let url = URL(string: imgEndpoint + movie.posterPath) {
            let placeholderImage = UIImage(named: "MovieDetailViewController.noImage")
            imageViewPoster.sd_setImage(with: url, placeholderImage: placeholderImage)
        }
    }
}
