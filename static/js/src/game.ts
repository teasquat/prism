class SimpleGame {

    constructor() {
        this.game = new Phaser.Game(800, 800, Phaser.AUTO, 'content', {
          preload: this.preload, create: this.create
        });
    }

    game: Phaser.Game;

    preload() {
        this.game.load.image('logo', '../../assets/profile.png');
    }

    create() {
        var logo = this.game.add.sprite(this.game.world.centerX, this.game.world.centerY, 'logo');
        logo.anchor.setTo(0.5, 0.5);
    }

}

window.onload = () => {
    var game = new SimpleGame();
};
