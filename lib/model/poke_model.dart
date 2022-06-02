// To parse this JSON data, do
//
//     final poke = pokeFromJson(jsonString);

import 'dart:convert';

Poke pokeFromJson(String str) => Poke.fromJson(json.decode(str));

String pokeToJson(Poke data) => json.encode(data.toJson());

class Poke {
    Poke({
        required this.pokemon,
    });

    List<Pokemon> pokemon;

    factory Poke.fromJson(Map<String, dynamic> json) => Poke(
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class Pokemon {
    Pokemon({
        required this.id,
        required this.num,
        required this.name,
        required this.img,
        required this.type,
        required this.height,
        required this.weight,
        required this.candy,
        required this.candyCount,
        required this.egg,
        required this.spawnChance,
        required this.avgSpawns,
        required this.spawnTime,
        required this.multipliers,
        required this.weaknesses,
        required this.nextEvolution,
        required this.prevEvolution,
    });

    int id;
    String num;
    String name;
    String img;
    List<String> type;
    String height;
    String weight;
    String candy;
    int candyCount;
    String egg;
    double spawnChance;
    double avgSpawns;
    String spawnTime;
    List<double> multipliers;
    List<String> weaknesses;
    List<Evolution> nextEvolution;
    List<Evolution> prevEvolution;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
        prevEvolution: List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount,
        "egg": egg,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": List<dynamic>.from(multipliers.map((x) => x)),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
        "next_evolution": List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
        "prev_evolution": prevEvolution == null ? null : List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
    };
}

class Evolution {
    Evolution({
        required this.num,
        required this.name,
    });

    String num;
    String name;

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
    };
}
