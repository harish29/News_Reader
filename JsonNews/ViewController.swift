//
//  ViewController.swift
//  JsonNews
//
//  Created by Geeksoft llc on 2/3/17.
//  Copyright © 2017 Geeksoft llc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblvw: UITableView!
  
  
    var myarticles: [TableViewCell1]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
        
            }
    
    func fetchArticles(){
       let urlreq = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=the-hindu&sortBy=top&apiKey=7ca6668299984f179723bd2a14a036f3")!)
        
        let task = URLSession.shared.dataTask(with: urlreq) { (data, response, error) in
            if error != nil{
                print(error)
                return
            }
            self.myarticles = [TableViewCell1]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                
                if let articles = json["articles"] as? [[String: AnyObject]] {
                    
                    for articles in articles{
                        let articl = TableViewCell1()
                        if let mytitle = articles["title"] as? String,
                            let myaut = articles["author"] as? String,
                            let mydesc = articles["description"] as? String,
                            let myurl = articles["url"] as? String,
                            let myimg = articles["urlToImage"] as? String{
                            
                            
                            articl.author = myaut
                            articl.medesc = mydesc
                            articl.imageurl = myimg
                            articl.url = myurl
                            articl.headline = mytitle
                            
                            
                        }
                        
                        self.myarticles?.append(articl)
                    }
                    
                }
                DispatchQueue.main.async {
                    self.tblvw.reloadData()
                }
               }
            catch let error{
                print(error)
            }
            
        }
       task.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articlecell", for: indexPath) as! cellviewTableViewCell
        
        cell.txt.text = self.myarticles?[indexPath.item].headline
        cell.desc.text = self.myarticles?[indexPath.item].medesc
        cell.aut.text = self.myarticles?[indexPath.item].author
        cell.img.downloadImage(from: (self.myarticles?[indexPath.item].imageurl!)!)
        
    return cell
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.myarticles?.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebviewViewController
        webvc.url = self.myarticles?[indexPath.item].url
        self.present(webvc, animated: true, completion: nil)
        
    }
    
}

extension UIImageView {
    func downloadImage(from url: String){
        
        let urlreq = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlreq) { (data, response, error) in
            if error != nil{
                print (error)
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }
    task.resume()}
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    


