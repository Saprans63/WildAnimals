//
//  RhinosViewController.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class RhinosViewController: UIViewController {

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
        Label.text = "TOP 5 FACTS ABOUT RHINOS"
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
    
extension RhinosViewController: UITableViewDelegate, UITableViewDataSource{
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

extension RhinosViewController {
    func addData() -> [Animals]{
        
        let data1 = Animals(title: "1. THERE ARE 5 SPECIES OF RHINO", infotext: "Two African – black and white rhinos – and three Asian – greater one-horned, Sumatran and Javan rhinos. Three of these (black, Sumatran and Javan) are listed as ‘critically endangered’ by IUCN – there are thought to be fewer than 70 Javan and 100 Sumatran rhinos left in the wild, meaning their populations are truly under threat of extinction. ", image: RhinoImage.rhinos1)
        
        let data2 = Animals(title: "2. THEY’RE HUGE", infotext: "Sumatran rhinos are the smallest, but they can still weigh 600kg (that’s almost 95 stone). And white rhinos are the largest, weighing up to 3,500kg (over 550 stone, or well over 3 tonnes!).  This is mighty impressive considering they mainly eat grass and leaves.", image: RhinoImage.rhinos2)
        
        let data3 = Animals(title: "3. BLACK AND WHITE RHINOS ARE BOTH, IN FACT, GREY", infotext: "The names of black and white rhinos are misleading – as both are actually grey. The white rhino is said to have gotten its name from the Afrikaans word for wide (‘wyd’), referring to its wide, square lip (in contrast, black rhinos have a pointy upper lip). Early English explorers mistook this word for ‘white’ and consequently named this species ‘white’ rhino, and the other ‘black’ rhino to differentiate.", image: RhinoImage.rhinos3)
        
        let data4 = Animals(title: "4. THEY’RE CALLED BULLS AND COWS", infotext: "Male rhinos are called 'bulls' and females are called 'cows'. Their young are ‘calves’.  Females tend to be more sociable than the more solitary, territorial males. Together, a group of rhinos is called a ‘crash’. ", image: RhinoImage.rhinos4)
        
        let data5 = Animals(title: "5. THEIR HORN IS MADE FROM THE SAME STUFF AS OUR FINGERNAILS", infotext: "Rhino horn is made up of keratin - the same protein which forms the basis of our hair and nails.  Javan and greater one-horned rhinos only have one horn, whereas all the other rhino species have two horns. Their horns grow continuously during their lifetime – the white rhino's horn can grow 7cm every year – and the record length is 150cm long! ", image: RhinoImage.rhinos5)
        
        
        return [data1, data2, data3, data4, data5]
    }
}
