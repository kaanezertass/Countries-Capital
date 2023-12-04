//
//  ViewController.swift
//  CountryApp
//
//  Created by Kaan Ezerrtaş on 4.12.2023.
//

import UIKit

class ViewController: UIViewController {

    var countryData = [CountryNames]()
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchData()
    }
    
    func fetchData() 
    {
     let url = URL(string: "http://haritibhakti.com/capitalname.json") //URL SSL OLARAK GÜVENİLİR OLMADIĞI İÇİN BURAYA KENDİ JSON URL'İ GİREBİLİRİSİNİZ.
        let task = URLSession.shared.dataTask(with: url! , completionHandler: {
         (data,response,error) in
            guard let data = data , error == nil else
            {
                print("error kaan")
                return
            }
            var clist = [CountryNames]()
            
            do
            {
                clist = try JSONDecoder().decode([CountryNames].self, from: data)
            }
            
            catch
            {
                print("kaan \(error)")
            }
            self.countryData = clist
            DispatchQueue.main.async{
                self.myTableView.reloadData()
            }
            
    })
        task.resume()
    }

}
                     
extension UIImageView
{
    func downloadImage(from url:URL)
    {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
            
            (data, response, error) in
            
            guard let HttpUrlRes = response as? HTTPURLResponse, HttpUrlRes.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data , error == nil,
                  let image = UIImage(data: data)
            else{
                return
            }
            
            DispatchQueue.main.async{
                self.image = image
            }
            
        })
        dataTask.resume()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.countryName.text = countryData[indexPath.row].countryName
        cell.capitalName.text = countryData[indexPath.row].capitalName
        let urlImage = URL(string: "http://haritibhakti.com\(String(describing: countryData[indexPath.row].flagImage))")
        cell.myImageView.downloadImage(from: urlImage!)
        cell.myImageView.layer.cornerRadius = 25
        return cell
    }
    
    
}
