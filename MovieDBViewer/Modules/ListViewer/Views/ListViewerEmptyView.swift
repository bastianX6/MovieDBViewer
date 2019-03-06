import UIKit

class ListViewerEmptyView: UIView {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupView(text: String, imageName: String) {
        imageView.image = UIImage(named: imageName)
        labelDescription.text = text
    }
}
