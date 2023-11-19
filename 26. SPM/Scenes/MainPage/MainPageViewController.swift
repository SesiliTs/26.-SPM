//
//  ViewController.swift
//  26. SPM
//
//  Created by Sesili Tsikaridze on 19.11.23.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    //MARK: - Private Properties
    
    private let headerLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "facts about cutest predators on the planet"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .black)
        return label
    }()
    
    private let tableView = UITableView()
    
    private let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private var facts = [CatFact]()
    
    private let viewModel = MainPageViewModel()
    
    
    //MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupTableView()
        setupStackView()
        setupViewModelDelegate()
        viewModel.viewDidLoad()
    }
    
    //MARK: - Private Functions
    
    
    private func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(tableView)
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    private func setupTableView() {
        registerTableViewCells()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.register(MainPageTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
    
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainPageTableViewCell
        let fact = facts[indexPath.row]
        cell.configure(with: fact.fact)
        return cell
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension MainPageViewController: MainPageViewModelDelegate {
    func factsFetched(_ facts: [CatFact]) {
        self.facts = facts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

