//
//  DetailViewController.swift
//  RealAPIApp
//
//  Created by Eren Demir on 24.04.2022.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    

    

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var comments = [Comment]()
    
    var photo = Photo(dictionary: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLogo()
        getComments()
        myTitle.text = photo.title
        if let url = URL(string: photo.url){
            myImage.contentMode = .scaleAspectFit
            myImage.load(url: url)
        }

    }
    
    
    /* METHODS*/
    
    func loadLogo() {
        if let logo = UIImage(named: "1.png") {
            let newLogo = Util.app.resizeImageWithAspect(image: logo, scaledToMaxWidth: 200, maxHeight: 50)
            let imageView = UIImageView(image: newLogo)
            self.navigationItem.titleView = imageView
        }
    }
    
    
    func getComments() {
        
        comments = []
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response , error in
            
            if let error = error {
                print("error: \(error)")
            }else{
                if let response = response as? HTTPURLResponse {
                    print("http status: \(response.statusCode)")
                }
                
                do{
                    if let json = try JSONSerialization.jsonObject(
                        with: data!,
                        options:[]) as? [[String:Any]]{
                        //print(json)
                        for dic in json {
                            self.comments.append(Comment(dictionary: dic))
                        }
                        
                        self.comments = Array(self.comments.prefix(10))
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }catch let error as NSError {
                    print("error: \(error.localizedDescription)")
                }
                
            }
            
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! DetailTableViewCell
        
        let row = comments[indexPath.row]
        
        cell.myName.text = row.name
        cell.myEmail.text = row.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = comments[indexPath.row]
       print(row)
        
    }


}

//https://jsonplaceholder.typicode.com/posts/1/comments
