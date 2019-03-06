import DZNEmptyDataSet
import UIKit

extension ListViewerViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return movies.count
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        return ListViewerCell.defaultSize
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard movies.count > 0, indexPath.row < movies.count,
            let cell = tableView.dequeueReusableCell(withIdentifier: ListViewerCell.reusableIdentifier) as? ListViewerCell else {
            return UITableViewCell()
        }
        let movie = movies[indexPath.row]
        cell.setupCell(title: movie.title, date: movie.humanDate, average: movie.voteAverage)
        return cell
    }
}

extension ListViewerViewController: DZNEmptyDataSetSource {
    func customView(forEmptyDataSet _: UIScrollView!) -> UIView! {
        guard let view = ListViewerEmptyView.nib.instantiate(withOwner: self, options: nil).first as? ListViewerEmptyView else {
            return nil
        }
        view.setupView(text: ListViewerLocalizer.emptyViewMessage.localizedString, imageName: "ListViewerEmptyView.icon")
        return view
    }
}
