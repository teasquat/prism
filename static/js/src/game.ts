class SimpleGame {

    constructor() {
        this.game = new Phaser.Game(800, 600, Phaser.AUTO, 'content', {
          preload: this.preload,
          create:  this.create,
          update:  this.update,
          render:  this.render,
        });
    }

    game: Phaser.Game;
    player: Phaser.Sprite;

    bg: Phaser.TileSprite;
    cursors: Phaser.CursorKeys;

    jump_timer = 0;
    jump_button: Phaser.Key;

    preload() {
        this.game.load.image("dude", "../../assets/dude.png");
        this.game.load.image("background", "../../assets/background.png");
    }

    create() {
        this.game.physics.startSystem(Phaser.Physics.ARCADE);

        this.bg = this.game.add.tileSprite(0, 0, 800, 600, "background");

        this.game.physics.arcade.gravity.y = 300;

        this.player = this.game.add.sprite(32, 320, "dude");
        this.game.physics.enable(this.player, Phaser.Physics.ARCADE);

        this.player.body.collideWorldBounds = true;
        this.player.body.gravity.y = 1000;
        this.player.body.maxVelocity.y = 500;
        this.player.body.setSize(20, 32, 5, 16);

        this.cursors = this.game.input.keyboard.createCursorKeys();
        this.jump_button = this.game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
    }

    update() {
      this.player.body.velocity.x = 0;

      if(this.cursors.left.isDown) {
        this.player.body.velocity.x = -150;
      } else if(this.cursors.right.isDown) {
        this.player.body.velocity.x = 150;
      }

      if(this.jump_button.isDown && this.player.body.onFloor()) {
        this.player.body.velocity.y = -500;
        this.jump_timer = this.game.time.now + 750;
      }
    }

    render() {
      this.game.debug.bodyInfo(this.player, 16, 24);
    }
}

window.onload = () => {
    var game = new SimpleGame();
};
