/*POKEMON*/
/*Gotta Catch Em' All */
/*Queries*/

/*A join involving at least four relations*/
/**select Pokemon.pokeID, Pokemon.name, typeName, abilityName, hiddenAbilityName
from Pokemon, Type, Ability
where Pokemon.pokeID = Type.pokeID
and pokemon.pokeID = ability.pokeID;**/

/*self join*/
select a.moveName, a.pokeID, a.HMID, b.moveName, b.pokeID
from pokeHaveHM a, pokeHaveHM b
where a.HMID = b.HMID
and a.pokeID = b.pokeID;


/*union*/
/**select pokeID
from Ability
where abilityName='Overgrow'
union
select pokeID
from Type
where typeName='Grass';**/

/*Intersect*/

/**select pokeID
from Type
where typeName='Fire'
intersect
select pokeID
from Pokemon
where regionName='Kanto';**/


/* avg */
select TO_CHAR(avg(evoLevel), '99.99') as Average_Evo_Level
from Evolution;

/*max*/
select *
from Pokemon
where  (pokeID) =
       (select max(pokeID)
        from Pokemon);


select *
from Pokemon
where  (pokeID) =
       (select min(pokeID)
        from Pokemon);

/**select typeName, count(pokeID) as Amount_Pokemon
from type
group by typeName
having count(pokeID) > 0
order by Amount_Pokemon;**/

SELECT pokeID, evoName
FROM Evolution
WHERE evoLevel >
        (select TO_CHAR(avg(evoLevel), '99.99')
        from Evolution);

SELECT pokeID
FROM Pokemon
WHERE
  pokeID NOT IN
        (SELECT pokeID
         FROM pokeHaveHM);

SELECT townName
FROM Towns
FULL OUTER JOIN Region
ON towns.regionName = region.regionName
WHERE GYMBADGE IS NOT NULL;








