import UIKit

class ListViewerCell: UITableViewCell {
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelAverage: UILabel!
    @IBOutlet var viewAverage: UIView!

    static let defaultSize: CGFloat = 70.0

    override func awakeFromNib() {
        super.awakeFromNib()
        viewAverage.layer.cornerRadius = 25.0
        viewAverage.clipsToBounds = false
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        labelTitle.text = nil
        labelDate.text = nil
        labelAverage.text = nil
        viewAverage.backgroundColor = .clear
    }

    func setupCell(title: String, date: String, average: Double) {
        labelTitle.text = title
        labelDate.text = date
        labelAverage.textColor = getAverageLabelColor(average: average)
        labelAverage.text = average > 0 ? String(format: "%.1f", average) : ListViewerLocalizer.noAverage.localizedString
        viewAverage.backgroundColor = getAverageViewColor(average: average)
    }

    private func getAverageViewColor(average: Double) -> UIColor {
        switch average {
        case _ where average <= 0:
            return .black
        case _ where average > 0 && average <= 0.3:
            return .red
        case _ where average > 0.3 && average < 0.70:
            return .yellow
        default:
            return .green
        }
    }

    private func getAverageLabelColor(average: Double) -> UIColor {
        guard average > 0.3, average < 0.70 else {
            return .white
        }
        return .black
    }
}
