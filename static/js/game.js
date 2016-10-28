var SimpleGame = (function () {
    function SimpleGame() {
        this.game = new Phaser.Game(800, 600, Phaser.AUTO, 'game', {
            preload: this.preload, create: this.create
        });
    }
    return SimpleGame;
}());

window.onload = function () {
    var game = new SimpleGame();
};
