//
//  LionViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class LionViewController: UIViewController {

    let tabelView = UITableView()
    var animals: [Animals] = []
    let Label = UILabel()
    
    struct Cells {
        static let animalCell = "AnimalsTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black

        animals = addData()
        ConfiTabView()
        TitleLabel()
    }
    
    // MARK: - Func
    
    func TitleLabel() {
        view.addSubview(Label)
        Label.text = "TOP 5 FACTS ABOUT LIONS"
        Label.numberOfLines = 0
        Label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        Label.textColor = .white
        
        Label.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.centerX.equalToSuperview()
        }
    }

    func ConfiTabView(){
        view.addSubview(tabelView)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.register(AnimalsTableViewCell.self, forCellReuseIdentifier: Cells.animalCell)
        constraints()
       
    }
    
    func constraints() {
        tabelView.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
  

}

// MAKE: - Extension
    
extension LionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.animalCell) as! AnimalsTableViewCell
        let animal = animals[indexPath.row]
        cell.set(animals: animal)
        return cell
    }
}

extension LionViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. NEARLY ALL WILD LIONS LIVE IN AFRICA, BUT ONE SMALL POPULATION EXISTS ELSEWHERE", infotext: "TNearly all wild lions live in Africa, below the Sahara Desert, but one small population exists around Gir Forest National Park in western India.  Lions in west and central Africa are more closely related to these Asiatic lions in India, than to those found in southern and east Africa.", image: LionImage.lion1)
        
        let data2 = Animals(title: "2. THEY CAN WEIGH 30 STONE", infotext: "On average, males weigh 190kg (almost 30 stone) and females weigh 126kg (almost 20 stone).  They need this weight and power behind them to hunt large prey and defend their pride.", image: LionImage.lion2)
        
        let data3 = Animals(title: "3. THEY START OFF SPOTTY", infotext: "Young lions have rosettes and spots on their sandy coats, but these generally disappear as they mature. ", image: LionImage.lion3)
        
        let data4 = Animals(title: "4. MALES’ MAGNIFICENT MANES TELL A STORY", infotext: "Male lions grow impressive manes the older they get. These manes grow up to 16cm long and are a sign of dominance. The older they get, the darker their manes go.   As well as attracting females, their manes may also protect their neck and head from injuries during fights. ", image: LionImage.lion4)
        
        let data5 = Animals(title: "5. CUBS ARE REARED TOGETHER", infotext: "A pride of lions is usually made up of related females and their cubs, plus a male or small group of males who defend their pride. The lionesses rear their cubs together and cubs can suckle from any female with milk. ", image: LionImage.lion5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}

