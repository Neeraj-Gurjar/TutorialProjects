import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var dataTableView:UITableView!
    
    var itemsArray = ["Sholay (1975)", "Mughal-e-Azam (1960)", "Mother India (1957)", "Dilwale Dulhania Le Jayenee (1995)","Pyaasa (1957)", "Guide (1965)", "Deewaar (1975)", "Lagaan (2001)", "Pakeezah (1972)", " Amar Akbar Anthony (1977)", " Do Bigha Zamin (1953)", " Jaane Bhi Do Yaaro (1983)", " 3 Idiots (2009)", " Kaagaz Ke Phool (1959)", " Bombay (1995)", " Mr India (1987)", " Satya (1998)", " Dil Chahta Hai (2001)", " Andaz Apna Apna (1994)", " Awaara (1951)", " Dil To Pagal Hai (1997)", " Om Shanti Om (2007)", " Shree 420 (1955)", " Jab We Met (2007)", " Parinda (1989)", " Shaan (1980)", " Zindagi Na Milegi Dobara (2011)", " Silsila (1981)", " Anand (1971)", " Prem Rog (1982)", " Barfi! (2012)", " GolMaal (1979)", " Ankur (1974)", " Ek Tha Tiger (2012)", " Chak De! India (2007)", " Kaala Patthar (1979)", " Ghajini (2008)", " Jodhaa Akbar (2008)", " Kabhi Khushi Kabhie Gham (2001)", " Dil Se (1998)", " The Lunchbox (2013)", " Khakee (2004)", " Maine Pyar Kiya (1989)", " Parvarish (1977)", " Velu Nayakan (1999)", " Kuch Kuch Hota Hai (1998)", " Mera Naam Joker (1970)", " Queen (2014)", " Main Hoon Na (2004)", " Rockstar (2011)", "Sangam (1964)", "Tezaab (1988)", "Sahib Bibi Aur Ghulam (1962)", "Tashan (2008)", "Satyam Shivam Sundaram (1978)", "Aiyyaa (2012)", "Mr & Mrs ’55 (1955)", "Garam Hawa (1973)", "Hum Hain Rahi Pya Ke (1993)", " Lootera (2013)", "Parineeta (1953)", "Sharmeelee (1971)", "Bunty Aur Babli (2005)", "agte Raho (1956)", "Chandni (1989)", "Madhumati (1958)", "Gunga Jumna (1961)", "Devdas (2002)", "Jewel Thief (1967)", "Chhoti Si Baat (1975)", "Omkara (2006)", "Zanjeer (1973)", "Naseeb (1981)", "Teesri Kasam (1966)", "Zubeidaa (2001)", "Udaan (2010)", "Kabhie Kabhie (1976)", "Bandit Queen (1994)", "Gangster (2006)", "Black (2005)", "Dabangg (2010)", "Kahaani (2012)", "Dhoom (2004)", "Arth (1982)", "Gangs of Wasseypur: Part One (2012)", "Black Friday (2004)", "Kati Patang (1970)", "Bhaag Milkha Bhaag (2013)", "Dhobi Ghat (2011)", "Hera Pheri (2000)", "Ardh Satya (1983)", "Lage Raho Munna Bhai (2006)", "Mujhse Dosti Karoge! (2002)", "Salaam Bombay! (1998)", "Swades (2004)", "Umrao Jaan (1981)", "Veer-Zaara (2004)", "Yeh Jawaani Hai Deewani (2013)", "Hum Aapke Hain Koun…! (1994)", "Bobby (1973)"]
    
    var batchSize = 5
    var totalCount:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.delegate = self
        totalCount = itemsArray.count
    }
    
    func loadMoreData() {
        // Download more data here
        var tempCount = self.batchSize + 5
        self.batchSize = tempCount
        print(batchSize)
        self.dataTableView.reloadData()
        }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return batchSize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellItem", for: indexPath)
        cell.textLabel!.text = itemsArray[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y+scrollView.frame.size.height) >= scrollView.contentSize.height){
            if batchSize < totalCount{
                loadMoreData()
            }
        }
    }
}
