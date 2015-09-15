import UIKit

class MyPlaylistCollectionViewCell: UICollectionViewCell {
    var playlist: Playlist!
    var index = -1
    let player = PlayerManager.instance
    var parent: HomeViewController! // for manage prayingList

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var mainArtworkImageView: UIImageView!
    @IBOutlet weak var infoView: UIView!

    @IBOutlet weak var sub1ArtworkImageView: UIImageView!
    @IBOutlet weak var sub2ArtworkImageView: UIImageView!

    @IBOutlet weak var playlistTitleLabel: UILabel!
    @IBOutlet weak var playlistCommentLabel: UILabel!

    let pauseButtonImage = UIImage(named: "PauseButton")
    let playButtonImage = UIImage(named: "playlistPlayButton")
    
    var gradientLayer: CAGradientLayer! = nil
    

    @IBAction func touchUpPlayButton(sender: AnyObject) {
        if index == parent.playingList {
            if player.isPausing() {
                play()
            } else {
                pause()
            }
        } else {
            player.setupPlaylist(playlist)
            parent.playingList = index
            play()
        }
    }

    func setup(playlist: Playlist) {
        initViewProp()
        self.playlist = playlist


        if let url = NSURL(string: playlist.songs[0].artworkUrl) {
            self.mainArtworkImageView.sd_setImageWithURL(url)
        }

        if playlist.songs.count > 1 {
            if let url = NSURL(string: playlist.songs[1].artworkUrl) {
                self.sub1ArtworkImageView.sd_setImageWithURL(url)
            }
        }

        if playlist.songs.count > 2 {
            if let url = NSURL(string: playlist.songs[2].artworkUrl) {
                self.sub2ArtworkImageView.sd_setImageWithURL(url)
            }
        }

        let image = UIImage(named: "playlistPlayButton")
        self.playButton.setBackgroundImage(image, forState: .Normal)
        self.playButton.setTitle("", forState: .Normal)

        self.playlistTitleLabel.text = playlist.title
        self.playlistCommentLabel.text = playlist.desc
    }

    func initViewProp(){
        let colorList: [CGColor] = [
            UIColor.colorFromRGB("000000", alpha: 0).CGColor,
            UIColor.blackColor().CGColor
        ]

        let locations: [CGFloat] = [0.0, 0.8]
        setGradient(self.infoView, colorList: colorList, locations: locations)
    }

    func setGradient(view: UIView, colorList: [CGColor]?, locations: [CGFloat]){
        if self.gradientLayer == nil {
            self.gradientLayer = CAGradientLayer()
            if let gradientColors = colorList {
                self.gradientLayer.colors = gradientColors
            }
            self.gradientLayer.locations = locations
            view.layer.insertSublayer(self.gradientLayer, atIndex: 0)
        }
        self.gradientLayer.frame = view.bounds
    }
}

// for play Playlist
extension MyPlaylistCollectionViewCell {
    func play() {
        self.playButton.setBackgroundImage(pauseButtonImage, forState: .Normal)
        player.play()
    }

    func pause() {
        player.pause()
        self.playButton.setBackgroundImage(playButtonImage, forState: .Normal)
    }
}
