# hipchat-pokemon-go

This is a simple hipchat bot that tracks which Pokémon Go team a user belongs to and any Pokémon encounters that are announced through a Hipchat room.

## Features
* Associate a user to a Pokémon team
* List basic information about each Pokémon in the game
* Track encounters of Pokémon on a per-room level
* Enable notifications of location-rare Pokémon on a per-room level

## Installation
This is not a currently a fully-fledge integration that you can install from the Hipchat integrations store, but may be one day. Currently the only way to add this integration is to spin up your own instance and use the BYOI button on the configuration integrations page for a Hipchat room.

### System Requirements
* NodeJS >= 4.x
* MySQL >= 5.x

### Setup Steps
1. Create a new database and import the `pokemon-go-base.sql` file into it
2. Setup a `config.json` file in the root project directory with values appropriate to you filled in
```json
{
    "hipchat" : {
        "endpoint" : "https://<your-team>.hipchat.com/v2",
        "tokens" : {
            "<room-id>" : "<secret>"
        }
    },
    "mysql" : {
        "host" : "<database-host>",
        "user" : "<username>",
        "password" : "<password>",
        "database" : "<database-name>"
    }
}
```
3. `npm install` to get all the runtime dependencies
4. `node src/index.js` to start the process or if running in the background use a process manager such as [pm2](https://github.com/Unitech/pm2)

## Usage
Once installed as an integration to a room, you can talk to the bot via slash commands. The command you register for is up to you with the current installation method, but the commands below assume `/pogo`

### Team Commands
`/pogo team <team> list` List all the members of the named team

`/pogo team <team> join` Join the named team. (This will cause you to leave any previously joined teams)

### Encounter Commands
`/pogo encounter <pokemon-id> <location>` Note that a pokemon was encountered, triggers room messages based on rarity. Location is optional.

### Pokedex Commands
`/pogo pokedex show <pokemon-id>` Shows the known information about the named Pokémon

`/pogo pokedex set-common <pokemon-id>` Sets the named Pokémon as common so that encounters of it do not cause room messages

`/pogo pokedex set-rare <pokemon-id>` Sets the named Pokémon as rare so that encounters of it do cause room messages

### References
`<team>` Either Instinct, Mystic, or Valor

`<pokemon-id>` Either the name or pokedex number of a pokemon

## License
The MIT License governs all code authored within this repository and no claims are made against the Pokémon intellectual properties, this is a for fun project. Pokémon is the intellectual property of Nintendo / Creatures Inc. / GAME FREAK inc. Pokémon Go is the property of Niantic, Inc.