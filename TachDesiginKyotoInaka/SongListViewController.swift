import UIKit

class SongListViewController: PageCellViewController {
    var songList: [Song] = []
    var songCount: Int = 0
    let checkedButtonImage = UIImage(named: "songPlusButton")
    let unCheckedButtonImage = UIImage(named: "checkedSongButton")

    @IBOutlet var songTableView: UITableView!

    override func setDataObject(dataObject: AnyObject?){
        if let _ = dataObject {
            self.songList = dataObject as! [Song]
        }else{
            print("DataObject is nil")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        //tableViewの作成、delegate,dataSourceを設定
        self.songTableView.delegate = self
        self.songTableView.dataSource = self
        
        self.songTableView.separatorColor = UIColor.darkGrayColor()
        self.songTableView.tableFooterView = UIView()
        self.songTableView.backgroundColor = UIColor.clearColor()

        self.view.addSubview(self.songTableView)
    }
    
    //Viewが表示される直前
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}

//tableViewに対するdelegate
extension SongListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let v = tableView.cellForRowAtIndexPath(indexPath) as! SongCell
        v.check()
        print("selected: \(indexPath.row)")
        appendSelectedItem(indexPath.row)
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let v = tableView.cellForRowAtIndexPath(indexPath) as! SongCell
        v.unCheck()
        print("deselected: \(indexPath.row)")
        removeSelectedItem(indexPath.row)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songList.count
    }
    
    //セルを作成
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell") as! SongCell
        cell.setup(self.songList[indexPath.row])
        
        if self.parent!.selectedItemIndexes[self.getIndex()!].contains(indexPath.row) {
            cell.check()
        } else {
            cell.unCheck()
        }
        return cell
    }
    
    //高さを計算したいけどとりあえず放置
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //let song = self.songList[indexPath.row]
        
        let height :CGFloat! = ConstantShare.songCellHeight
        
        if height != nil{
            return height
        } else {
            return tableView.estimatedRowHeight
        }
    }
}
