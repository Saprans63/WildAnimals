//
//  JaguarsViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class JaguarsViewController: UIViewController {

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
        Label.text = "TOP 5 FACTS ABOUT JAGUARS"
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
    
extension JaguarsViewController: UITableViewDelegate, UITableViewDataSource{
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

extension JaguarsViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. THEY HAVE A MIGHTY NAME", infotext: "The word 'jaguar' comes from the indigenous word 'yaguar', which means 'he who kills with one leap'. You’ll find out why later", image: JaguarImage.jaguar1)
        
        let data2 = Animals(title: "2. THEIR TERRITORY IS SHRINKING", infotext: "Jaguars used to be found from south-west USA, throughout South America to almost the far north in Argentina. Now, they’ve been virtually eliminated from half of their historic range.   The jaguars’ stronghold is in Brazil – it may hold around half of the estimated 170,000 wild jaguars. Most of these big cats are found in the Amazon rainforest and the Pantanal, the largest tropical wetland.", image: JaguarImage.jaguar2)
        
        let data3 = Animals(title: "3. THEY’RE ON THE CHUNKY SIDE", infotext: "The jaguar is the third biggest cat in the world - after the tiger and the lion - and is the largest cat in the Americas. They can grow up to 170cm long, not including their impressive tails which can be up to 80cm.  Males can weigh 120kg (that’s almost 19 stone), but the size of jaguars can vary a lot between regions - jaguars in central America can be roughly half the size of jaguars in the Pantanal. They need that bulk behind them to take on big prey, including giant caiman.", image: JaguarImage.jaguar3)
        
        let data4 = Animals(title: "4. THEY’VE GOT SPOTTY SPOTS", infotext: "The African elephant is the world's largest land mammal – with males on average measuring up to 3m high and weighing up to 6 tonnes. Males only reach their full size at 35-40 years - that’s well over half their lifespan as wild elephants can live for up to 60-70 years. And it’s not just the adults – even calves are huge! At birth elephants can weigh 120kg - that’s almost 19 stone.", image: JaguarImage.jaguar4)
        
        let data5 = Animals(title: "5. THEY’VE GOT THICK SKIN", infotext: "To the untrained eye, jaguars can be mistaken for leopards, but you can tell the difference from their rosettes (circular markings): Jaguars have black dots in the middle of some of their rosettes, whereas leopards don’t. Jaguars also have larger, rounded heads and short legs.  Jaguars can be “melanistic, where they appear almost black. Melanistic jaguars (and leopards) are known as “black panthers. ", image: JaguarImage.jaguar5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}

