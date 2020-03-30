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
    private var cancalable1: AnyCancellable?
    private var cancalable2: AnyCancellable?
    private var cancalable3: AnyCancellable?
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var deaths: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        casess()
        deathss()
        recovereds()
        tableView.reloadData()
        
    }
    
    
    func deathss(){
        self.cancalable = self.webService.fetchData()
            .catch {_ in Just(Latest.placeholder) }
            .map { "\(String(describing: $0.deaths!))" }
            .assign(to: \.text, on: self.deaths!)
    }
    
    func casess(){
        self.cancalable1 = self.webService.fetchData1()
            .catch {_ in Just(Latest.placeholder) }
            .map { "\(String(describing: $0.confirmed!))" }
            .assign(to: \.text, on: self.cases!)
    }
    
    func recovereds(){
        self.cancalable2 = self.webService.fetchData2()
            .catch {_ in Just(Latest.placeholder) }
            .map { "\(String(describing: $0.recovered!))" }
            .assign(to: \.text, on: self.recovered!)
    }
    
    func locca(){
        self.cancalable3 = self.webService.fetchData3()
            .catch {_ in Just(RPdata.placeholder) }
            .map {$0.locations?.country }
            .assign(to: \.text, on: self.recovered!)
    }
    
    
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


