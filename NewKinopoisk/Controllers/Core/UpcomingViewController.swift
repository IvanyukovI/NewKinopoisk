//
//  UpcomingViewController.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 10.05.2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var titles: [Title] = [Title]()
    
    private let upcommingTable:UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifire)
        return table

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Upcomming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        
        view.addSubview(upcommingTable)
        upcommingTable.delegate = self
        upcommingTable.dataSource = self
        
        fetchUpcomming()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcommingTable.frame = view.bounds
    }
    
    private func fetchUpcomming (){
        APICaller.shared.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcommingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }

}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifire, for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.fullTitle ?? title.title ?? "Unknown name", imageURL: title.image ?? "Unknown image"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
