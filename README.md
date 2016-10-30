# prism

A Crystal library for serving TypeScript compiled Phaser web-based games. Using utilities of the Crystal standard library and *Kemal*, as a server for Phaser allows for super-fast serving and socketing stuff.

Example serving with Kemal:

```
2016-10-28 22:58:15 +0200 200 GET /style/main.css 65.6µs
2016-10-28 22:58:15 +0200 200 GET /script/phaser.min.js 542.2µs
2016-10-28 22:58:15 +0200 200 GET /script/game.js 31.8µs
2016-10-28 22:58:15 +0200 200 GET /assets/profile.png 81.6µs
```

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  prism:
    github: teasquat/prism
```


## Usage


```crystal
require "prism"
```

---

To setup basic Phaser things:

```bash
$ make setup
```

To build server binary and TypeScript files:

```bash
$ make
```

To run server:

```bash
$ make run
```

If running into weird stuff:

```bash
sudo ln -s /usr/bin/nodejs /usr/bin/node
```

---

## Development

```
- Add socket-based connections to Phaser (for multiplayer)

- Add database handling

- Add TypeScript *framework* for online-multiplayer/highscore/saves

- Implement templates for different example games

- Add possibility of *Electron* desktop apps

- Get hyped and make nice web-based games
```

## Contributing

1. Fork it ( https://github.com/teasquat/prism/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [nilq](https://github.com/nilq) Lord Niels N. Horn - crystal cooking

- [snillerboy](https://github.com/snillerboy999) William Kattrup - crystal cooking, Phaser magic

- [FuzzyLitch](https://github.com/FuzzyLitch) Emile <insert french here> - UDP wizard
