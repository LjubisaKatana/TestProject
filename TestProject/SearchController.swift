//
//  SearchController.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/19/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    // MARK: - Properties
    private var formaNames = ["All Types", "All Regions", "Beds From", "Beds To", "Price From"]
    private var propertyType = ["All Types", "Apartments", "Commercial Property", "Plots","Townhouses", "Villas/Bungalows"]
    private var propertyRegions = ["Limmasol", "Nicossia", "Paphos", "Polis", "Larnaca"]
    private var textPickerProvider: String?
    
    private var TV: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var viewFrame: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(searchHandler), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTableView()
        configureButtons()
    }
    
    // Action
    @objc func resetHandler() {
        print(#function)
    }
    
    @objc func searchHandler() {
        print(#function)
    }
}

// MARK: - Table view data source
extension SearchController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formaNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TV.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)

        let name = formaNames[indexPath.row]

        cell.textLabel?.text = name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TV.deselectRow(at: indexPath, animated: true)
    }
}
private extension SearchController {
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Find Your Home"
    }
    
    func configureTableView() {
        TV.delegate = self
        TV.dataSource = self
        TV.register(SearchCell.self, forCellReuseIdentifier: "searchCell")
        TV.rowHeight = 100
        TV.isScrollEnabled = false
    }
    
    func configureButtons() {
        [TV, viewFrame, resetButton, searchButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            viewFrame.topAnchor.constraint(equalTo: TV.bottomAnchor, constant: 10),
            viewFrame.heightAnchor.constraint(equalToConstant: 200),
            viewFrame.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            viewFrame.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            viewFrame.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            TV.topAnchor.constraint(equalTo: guide.topAnchor),
            TV.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            TV.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            resetButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            resetButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            resetButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -51),
            resetButton.heightAnchor.constraint(equalToConstant: 60),
            
            searchButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            searchButton.bottomAnchor.constraint(equalTo: resetButton.topAnchor, constant: -10),
            searchButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

//self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
//self.tableView.estimatedRowHeight = 85.0;
//self.tableView.rowHeight = UITableViewAutomaticDimension;
