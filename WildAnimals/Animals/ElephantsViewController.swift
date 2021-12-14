//
//  ElephantsViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class ElephantsViewController: UIViewController {

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
        Label.text = "TOP 5 FACTS ABOUT ELEPHANTS"
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
    
extension ElephantsViewController: UITableViewDelegate, UITableViewDataSource{
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

extension ElephantsViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. THEY’RE THE WORLD’S LARGEST LAND ANIMAL", infotext: "The African elephant is the world's largest land mammal – with males on average measuring up to 3m high and weighing up to 6 tonnes. Males only reach their full size at 35-40 years - that’s well over half their lifespan as wild elephants can live for up to 60-70 years. And it’s not just the adults – even calves are huge! At birth elephants can weigh 120kg - that’s almost 19 stone.", image: ElephantImage.elephant1)
        
        let data2 = Animals(title: "2. YOU CAN TELL THE TWO SPECIES APART BY THEIR EARS", infotext: "There are two species of elephant: African and Asian. The ears of African elephants are much larger than their cousins and are described as being shaped like the African continent, whereas the ears of Asian elephants are shaped like the Indian subcontinent. There’s also a trunk difference - African elephants have two ‘fingers’ at the tip of their trunks, whereas Asian elephants have one.", image: ElephantImage.elephant2)
        
        let data3 = Animals(title: "3. THEIR TRUNKS HAVE MAD SKILLS", infotext: "Elephants have around 150,000 muscle units in their trunk. Their trunks are perhaps the most sensitive organ found in any mammal - Asian elephants have been seen to pick up a peanut, shell it, blow the shell out and eat the nut. Elephants use their trunks to suck up water to drink – it can contain up to 8 litres of water. They also use their trunks as a snorkel when swimming.", image: ElephantImage.elephant3)
        
        let data4 = Animals(title: "4. THEIR TUSKS ARE ACTUALLY TEETH", infotext: "The African elephant is the world's largest land mammal – with males on average measuring up to 3m high and weighing up to 6 tonnes. Males only reach their full size at 35-40 years - that’s well over half their lifespan as wild elephants can live for up to 60-70 years. And it’s not just the adults – even calves are huge! At birth elephants can weigh 120kg - that’s almost 19 stone.", image: ElephantImage.elephant4)
        
        let data5 = Animals(title: "5. THEY’VE GOT THICK SKIN", infotext: "An elephant’s skin is 2.5cm thick in most places.  The folds and wrinkles in their skin can retain up to 10 times more water than flat skin does, which helps to cool them down. They keep their skin clean and protect themselves from sunburn by taking regular dust and mud baths.", image: ElephantImage.elephant5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}
