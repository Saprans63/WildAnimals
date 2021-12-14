//
//  OrangutansViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class OrangutansViewController: UIViewController {

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
        Label.text = "TOP 5 FACTS ABOUT ORANGUTANS"
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
    
extension OrangutansViewController: UITableViewDelegate, UITableViewDataSource{
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

extension OrangutansViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. THERE ARE 3 SPECIES OF ORANGUTAN", infotext: "The Bornean, the Sumatran and the recently confirmed new species (as of 2017), the Tapanuli. These great apes are only found in the wild on the islands of Borneo and Sumatra.   All three species are critically endangered, with just over 100,000 Bornean, fewer than 14,000 Sumatran, and less than  800 Tapanuli orangutans left.  Although they might look fairly similar with their fluffy ginger fur, Bornean orangutans have darker red coats and rounder faces than their Sumatran cousins.    But they do have some similarities - adult males have a beard and moustache - and adult female Sumatran orangutans also have beards.", image: OrangutanImage.orangutan1)
        
        let data2 = Animals(title: "2. ORANGUTANS ARE THE HEAVIEST TREE-DWELLING ANIMAL", infotext: "They spend most of their lives swinging through the canopies and need vast stretches of forest to find enough food and mates.  Deforestation and hunting are the biggest threats to orangutans. Borneo alone is projected to lose 220,000 km sq of forest between 2010 and 2030 – that's almost 30% of its total land area; well over the size of the entire United Kingdom. This is largely for agriculture and infrastructure (such as roads), but forest fires are also becoming more frequent with climate change.  The good news is that studies have shown deforestation is slowing down in Borneo. And Indonesia and Malaysia are setting stronger requirements for forest protection.", image: OrangutanImage.orangutan2)
        
        let data3 = Animals(title: "3. THEY'VE GOT LONG ARMS", infotext: "Orangutans have an arm span of about 2.2 m (over 7 ft) from fingertip to fingertip.   Considering their standing height is around 1. 5 m, this is an impressive reach. Their arms are so long in fact that they’re one and a half times longer than their legs and stretch to their ankles when standing. ", image: OrangutanImage.orangutan3)
        
        let data4 = Animals(title: "4. THEY DON'T MIND EATING WITH THEIR FEET", infotext: "Orangutans are incredibly dexterous and use both hands and feet while gathering food and travelling through the trees. Like us, orangutans have four fingers and a thumb, and fingernails. Their feet look almost exactly the same as their hands – designed for agile climbing and gripping. ", image: OrangutanImage.orangutan4)
        
        let data5 = Animals(title: "5. THEY LEARN EVERYTHING THEY NEED TO KNOW FROM MUM", infotext: "Young orangutans stay with their mother until they reach around 7 years old. They spend this time learning everything from her – including what’s good to eat.   Infants are so attached to their mums that they ride on her body and sleep in her nest until they develop their own skills to survive on their own.  Because of this long learning curve, orangutans only have young once every 7 – 9 years, which is the longest birth interval of any land mammal.", image: OrangutanImage.orangutan5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}

