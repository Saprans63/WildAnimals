//
//  PolarBearsViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class PolarBearsViewController: UIViewController {


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
        Label.text = "TOP 5 FACTS ABOUT POLAR BEARS"
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
    
extension PolarBearsViewController: UITableViewDelegate, UITableViewDataSource{
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

extension PolarBearsViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. POLAR BEARS ARE CLASSIFIED AS MARINE MAMMALS", infotext: "Because they spend most of their lives on the sea ice of the Arctic Ocean depending on the ocean for their food and habitat, polar bears are the only bear species to be considered marine mammals.", image: PalarBears.paloBear1)
        
        let data2 = Animals(title: "2. POLAR BEARS ARE ACTUALLY BLACK, NOT WHITE", infotext: "Polar bear fur is translucent, and only appears white because it reflects visible light. Beneath all that thick fur, their skin is jet black.", image: PalarBears.paloBear2)
        
        let data3 = Animals(title: "3. THEY CAN SWIM CONSTANTLY FOR DAYS AT A TIME", infotext: "As well as reaching speeds of up to 6mph in the water, polar bears can swim for long distances and steadily for many hours to get from one piece of ice to another. Their large paws are specially adapted for swimming, which they’ll use to paddle through the water while holding their hind legs flat like a rudder.", image: PalarBears.paloBear3)
        
        let data4 = Animals(title: "4. LESS THAN 2% OF POLAR BEAR HUNTS ARE SUCCESSFUL", infotext: "Although about half of a polar bear’s life is spent hunting for food, their hunts are rarely successful. Polar bears main prey consists of ringed seals and bearded seals, though they will also scavenge carcasses or settle for small mammals, birds, eggs and vegetation.", image: PalarBears.paloBear4)
        
        let data5 = Animals(title: "5. SCIENTISTS CAN EXTRACT POLAR BEAR DNA FROM JUST THEIR FOOTPRINTS", infotext: "An innovative new technique developed by WWF and DNA specialist firm SPYGEN allows scientists to isolate DNA from a polar bear’s footprint in the snow. Two tiny scoops of snow from a polar bear track revealed not just the DNA of the polar bear that made it, but even from a seal it had recently eaten.", image: PalarBears.paloBear5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}
