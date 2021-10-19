import UIKit
import SnapKit

class MoviesListViewController: UIViewController {
    //MARK: Properties
    private let viewModel: MoviesListViewModel
    
    //MARK: UI Properties
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    //MARK: Init
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Lifecycle
extension MoviesListViewController {
    override func viewDidLoad() {
        setupView()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.ready()
        super.viewWillAppear(animated)
    }
}

extension MoviesListViewController {
    func setupView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupViewModel() {
        viewModel.dataReady = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.isLoading = { isLoading in
            if isLoading {
                print("Showing Loader")
            } else {
                print("Dismissing Loader")
            }
        }
        
        viewModel.gotError = { error in
            print(error.localizedDescription)
        }
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = viewModel.movies
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].isFavourite ? "Favourite" : "Not"
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didFavouriteMovie(at: indexPath)
    }
}
