//
//  PangolinsViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class PangolinsViewController: UIViewController {


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
        Label.text = "TOP 5 FACTS ABOUT PANGOLINS"
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
    
extension PangolinsViewController: UITableViewDelegate, UITableViewDataSource{
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

extension PangolinsViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. PANGOLIN MEANS 'ROLLER'", infotext: "The word Pangolin comes from ‘penggulung,’ the Malay word for roller – the action a pangolin takes in self-defense. A startled pangolin will cover its head with its front legs, exposing its scales to any potential predator. If touched or grabbed it will roll up completely into a ball, while the sharp scales on the tail can be used to lash out. Pangolins are also referred to as 'scaly anteaters' because of their preferred diet - ants.", image: Pangolins.pangolin1)
        
        let data2 = Animals(title: "2. THERE ARE EIGHT SPECIES OF PANGOLIN", infotext: "Four species of pangolin can be found in Africa, and four in Asia. The four species that live in Africa are: Black-bellied pangolin (Phataginus tetradactyla) White-bellied pangolin (Phataginus tricuspis) Giant Ground pangolin (Smutsia gigantea) Temminck's Ground pangolin (Smutsia temminckii) The four species that live in Asia are: Indian pangolin (Manis crassicaudata) Philippine pangolin (Manis culionensis) Sunda pangolin (Manis javanica) Chinese pangolin (Manis pentadactyla)", image: Pangolins.pangolin2)
        
        let data3 = Animals(title: "3. PANGOLINS ARE THREATENED", infotext: "All eight pangolin species are protected under national and international laws, and two are listed as Critically Endangered on the IUCN Red List of Threatened Species.", image: Pangolins.pangolin3)
        
        let data4 = Animals(title: "4. PANGOLINS ARE THE MOST TRAFFICKED MAMMALS IN THE WORLD", infotext: "In China and Vietnam, pangolins are highly prized by consumers for their meat and their unique scales. While they are a potent defence against predators, their scales are useless against poachers, and all eight species in Asia and Africa are now under threat. Over the past decade, over a million pangolins have been illegally taken from the wild to feed demand in China and Vietnam. Their meat is considered a delicacy, while their scales are used in traditional Chinese medicine as they are believed to treat a range of ailments from asthma to rheumatism and arthritis.", image: Pangolins.pangolin4)
        
        let data5 = Animals(title: "5. YOU CAN HELP PANGOLINS", infotext: "Despite their threatened status, there is good news for pangolins. The Convention on International Trade in Endangered Species (CITES) recently voted to end international commercial trade in all pangolins through listing the eight species in Appendix I of the Convention, a ruling that will come into force early this year. However, the illegal widlife trade is still a threat to pangolins. You can help protect them by reporting wildlife crime.", image: Pangolins.pangolin5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}
