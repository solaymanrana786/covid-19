//
//  ViewController.swift
//  Covid19
//
//  Created by Solayman Rana on 24/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var vSpinner : UIView?
    var data: RPdata?
    var count: Int?
    
    private var webService = Api()
    private var cancalable: AnyCancellable?
    
      
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var deaths: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        
//         Do any additional setup after loading the view.
//                 getCasesData()

        self.cancalable = self.webService.fetchData()
            .catch {_ in Just(Latest.placeholder) }
            .map { "\(String(describing: $0.confirmed))" }
            .assign(to: \.text, on: self.cases!)
        
        
        
        
//
//        self.cancalable = self.webService.fetchData()
//        .catch {_ in Just(Latest.placeholder) }
//        .map { "\(String(describing: $0.deaths))" }
//        .assign(to: \.text, on: self.deaths!)
//
//        self.cancalable = self.webService.fetchData()
//            .map { $0.latest?.confirmed }
//
//        .replaceError(with: [])
//        .eraseToAnyPublisher()
//        .sink(receiveValue: { posts in
//            print(posts.count)
//        })
//        //...
//        self.cancalable?.cancel()
    }
    
  
    
//    func getData(){
//
//        var request = URLRequest(url: URL(string: "https://coronavirus-tracker-api.herokuapp.com/v2/locations")!)
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            do {
//                let jsonDecoder = JSONDecoder()
//                let responseModel = try jsonDecoder.decode(RPdata.self, from: data!)
//                //print(responseModel)
//                self.data = responseModel
//                print(self.data)
//            } catch {
//                print("JSON Serialization error")
//            }
//        }).resume()
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
//        cell.countryName.text = "\(data?.locations![indexPath.row].country ?? "")"
//        cell.cases.text = "\(String(describing: data?.locations![indexPath.row].latest?.confirmed ?? 0) )"
//        cell.death.text = "\(String(describing: data?.locations![indexPath.row].latest?.deaths ?? 0))"
//        cell.recover.text = "\(String(describing: data?.locations![indexPath.row].latest?.recovered ?? 0))"
        return cell
    }
    
}


//extension ViewController {
//
//       func getCasesData(){
//
//        showSpinner(onView: self.view)
//        Api.getCases(customerID: 1) { (data, responseStatus) in
//            if(responseStatus.isSuccess){
//               // print(rpUser?.toJSON())
//                self.data = data
//                self.count = data?.locations?.count
//               print("Data",data)
//                self.cases.text = "\(data!.latest!.confirmed!)"
//                self.deaths.text = "\(data!.latest!.deaths!)"
//                self.recovered.text = "\(data!.latest!.recovered!)"
//                self.tableView.reloadData()
//                self.removeSpinner()
//            }
//            else{
//                print("Not Found>>>>>>>>")
//            }
//        }
//
//
//    }
//
//    func showSpinner(onView : UIView) {
//        let spinnerView = UIView.init(frame: onView.bounds)
//        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
//        ai.startAnimating()
//        ai.color = .red
//        ai.center = spinnerView.center
//
//        DispatchQueue.main.async {
//            spinnerView.addSubview(ai)
//            onView.addSubview(spinnerView)
//        }
//
//        vSpinner = spinnerView
//    }
//
//    func removeSpinner() {
//        DispatchQueue.main.async {
//          self.vSpinner?.removeFromSuperview()
//          self.vSpinner = nil
//        }
//    }
//
//}
