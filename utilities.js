function calcMaxHealth(str) {
    // From auto-code: (Base Strength + Mod Strength - 1) * 2 + 10 + Item HP
    return (str-1)*2 + 10;

}

function calcMaxMana(itl) {
    // Base Intelligence * 2 + 8 + Item MP
    // From auto-code: ( Base Int + Current Int - 1) * 2 + 10
    return itl*2 + 8;
}

function calcMaxLoad(level, str) {
    // 7 + Level * 5 + Total Strength * 8
    // Because it's total strength, this is approximate
    return 7 + level*5 + str*8;
}

function calcPetLevel(level, cha) {
    // 1.5 * Min( Level, Base Charisma + Item Charisma/2 )
    // Again, approximate here because we don't know the item charisma
    return Math.ceil( 1.5 * Math.min(level, cha) );
}

function calcMaxDamage(str, dex) {
    // Ceil( attack * 1.2 + Total Strength / 2 + Total Dexterity / 3 )
    // Again with the approximation
    return Math.ceil(str/2 + dex/3);
}

function calcHitChance(dex, level) {
    // Round( Pow( Total Dexterity, 0.5 ) / ( Pow( Total Dexterity, 0.5 ) + Pow( Level *2, 0.5 )) * 100 )
    var dexChance = Math.pow(dex, 0.5);
    return Math.round( dexChance / (dexChance + Math.pow(level*2, 0.5)) * 100 );
}
