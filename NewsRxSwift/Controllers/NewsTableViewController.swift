//
//  NewsTableViewController.swift
//  NewsRxSwift
//
//  Created by Ivan Ivanov on 5/9/21.
//

import UIKit
import RxCocoa
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(largeTitleColor: .white, backgoundColor: #colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8588235294, alpha: 1), tintColor: .white, title: "Good News", preferredLargeTitle: true)
        
        populateNews()
    }
    
    private func populateNews() {
        
      URLRequest.load(resource: ArticlesList.all).subscribe(onNext: { [weak self] result in
            if let result = result {
                self?.articles = result.articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
     }
}

extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = articles[indexPath.row].title
       cell.desciptionTitle.text = articles[indexPath.row].description
        
        return cell
    }
}
