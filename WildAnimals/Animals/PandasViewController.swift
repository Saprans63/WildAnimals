//
//  PandasViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class PandasViewController: UIViewController {

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
        Label.text = "TOP 5 FACTS ABOUT PANDAS"
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
    
extension PandasViewController: UITableViewDelegate, UITableViewDataSource{
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

extension PandasViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. THEY HAVE GREAT CAMOUFLAGE FOR THEIR ENVIRONMENT", infotext: "The giant panda's distinct black-and-white markings have two functions: camouflage and communication.  Most of the panda - its face, neck, belly, rump - is white to help it hide in snowy habitats. The arms and legs are black, helping it to hide in shade. ", image: PandaImage.panda1)
        
        let data2 = Animals(title: "2. THEIR EYES ARE DIFFERENT TO NORMAL BEARS", infotext: "Like domestic cats, giant pandas have vertical slits for pupils.", image: PandaImage.panda2)
        
        let data3 = Animals(title: "3. CUBS ARE WELL PROTECTED IN THEIR FIRST MONTH", infotext: "Mother pandas keep contact with their cub nearly 100% of the time during their first month - with the cub resting on her front and remaining covered by her paw, arm or head. ", image: PandaImage.panda3)
        
        let data4 = Animals(title: "4. COURAGEOUS CUBS!", infotext: "At 5 months old, giant pandas learn how to climb - sometimes practicing by climbing on their mum. ", image: PandaImage.panda4)
        
        let data5 = Animals(title: "5. A HELPING HAND", infotext: "They have an extended wrist bone that they use like a thumb to help them grip food.", image: PandaImage.panda5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}

