//verification de quand est ce qu'on peut mettre un bulbe
var bulbe = getCooldown(CHIP_PUNY_BULB);
//mes coordonnées
var posme = getCell();
var cell_x_me = getCellX(posme);
var cell_y_me = getCellY(posme);
//case derriere
var cell_back = getCellFromXY(cell_x_me + 1, cell_y_me + 1);
//case devant
var cell_front = getCellFromXY(cell_x_me - 1, cell_y_me - 1);
//case à droite
var cell_right = getCellFromXY(cell_x_me + 1, cell_y_me - 1);
//case à gauche
var cell_left = getCellFromXY(cell_x_me - 1, cell_y_me + 1);
//cases en biai
var cell_br = getCellFromXY(cell_x_me + 1, cell_y_me);
var cell_fr = getCellFromXY(cell_x_me - 1, cell_y_me);
var cell_bl = getCellFromXY(cell_x_me, cell_y_me + 1);
var cell_fl = getCellFromXY(cell_x_me, cell_y_me - 1);


//on recupere le nombre d'ennemis restants
var ennemis=getEnemiesCount();
//on recupere l'ennemi le plus proche
var ennemi=getNearestEnemy();


//j'equipe le magnum au premier tour
if (getTurn()<=1 and getWeapon()!=WEAPON_MAGNUM) {
	setWeapon(WEAPON_MAGNUM);
}
//declaration de mon arme
var arme=getWeapon();

//tant que j'ai des PT ou des mouvements
while (getTP()>=getWeaponCost(arme) or getMP()>=1) {
	//je recupere l'ennemi le plus proche
	ennemi=getNearestEnemy();
	//si l'adversaire a plus de 200pv
	if (getLife(ennemi)>200) {
		//si j'en ai plus de 200
		if (getLife()>200) {
			//création d'un bulbe
			if (bulbe == 0) {
				debug("bulbe");
				if (getCellContent(cell_back) == 0) {
					summon(CHIP_PUNY_BULB, cell_back, bulbAI);
				} else if (getCellContent(cell_front) == 0) {
					summon(CHIP_PUNY_BULB, cell_front, bulbAI);
				} else if (getCellContent(cell_left) == 0) {
					summon(CHIP_PUNY_BULB, cell_left, bulbAI);
				} else if (getCellContent(cell_right) == 0) {
					summon(CHIP_PUNY_BULB, cell_right, bulbAI);
				}
			}
			//bouclier / casque / mur
			if (getTurn() >= 2) {
				debug("protection");
				useChip(CHIP_SHIELD, getLeek());
				useChip(CHIP_WALL, getLeek());
				useChip(CHIP_HELMET, getLeek());
			}
			//si le chemin vers l'adversaire est plus court ou egal 5 et que je peux faire une attaque au moins
			if (getPathLength(getCell(), getCell(ennemi))<=getMP() and getTP()>=getWeaponCost(WEAPON_AXE)) {
				debug("hache");
				//je prends ma hache si je ne l'ai pas
				if (getWeapon()!=WEAPON_AXE) {
					setWeapon(WEAPON_AXE);
				}
				//j'approche jusqu'à lui
				moveToward(ennemi);
				//je chope mes tp
				var TP = getTP();
				while (TP>=getWeaponCost(WEAPON_AXE)) {
					//je frappe
					useWeapon(ennemi);
					TP-=getWeaponCost(WEAPON_AXE);
				}
				//si je peux me soigner
				if (getTP()>=getChipCost(CHIP_BANDAGE)) {
					//je me soigne	
					useChip(CHIP_BANDAGE, getLeek());
				}
			}
			//si en avancant je peux me retrouver à 8 cases de l'ennemi et que je peux faire au moins un tir
			else if ((getCellDistance(getCell(), getCell(ennemi))-getMP()<=getWeaponArea(WEAPON_MAGNUM)) and getTP()>=getWeaponCost(WEAPON_MAGNUM)) {
				debug("magnum");
				//je prends le magnum si je ne l'ai pas
				if (getWeapon()!=WEAPON_MAGNUM) {
					setWeapon(WEAPON_MAGNUM);
				}
				//j'approche à 8 cases de lui
				while (getCellDistance(getCell(), getCell(ennemi))>getWeaponArea(WEAPON_MAGNUM) and getMP()>=1) {
					moveToward(ennemi,1);
				}
				//je choppe mes tp
				var TP=getTP();
				while (TP>=getWeaponCost(WEAPON_MAGNUM)) {
					//je tire
					useWeapon(ennemi);
					TP-=getWeaponCost(WEAPON_MAGNUM);
				}
				//si jamais il y avait un obstacle j'utilise les flames
				TP=getTP();
				while (TP>=getChipCost(CHIP_SPARK)) {
					//je tire
					useChip(CHIP_SPARK, ennemi);
					TP-=getChipCost(CHIP_SPARK);
				}
			}
			//si je suis trop faible en PT
			else if (getTP()>=getChipCost(CHIP_BANDAGE) and getLife()<500) {
				debug("soins par manque de PT");
				//je recule et j'essaye de me soigner
				moveAwayFrom(ennemi);
				useChip(CHIP_BANDAGE, getLeek());
			}
			//sinon
			else {
				debug("avance");
				//j'avance vers l'ennemi en me soignant
				moveToward(ennemi);
				if (getTP()>=getChipCost(CHIP_CURE)) {
					useChip(CHIP_CURE, getLeek());	
				}
				while (getTP()>=getChipCost(CHIP_BANDAGE)) {
					useChip(CHIP_BANDAGE, getLeek());
				}
			}
		}	
		//sinon
		else {
			debug("soins par manque de vie");
			//je recule et je me soigne
			moveAwayFrom(ennemi);
			if (getTP()>=getChipCost(CHIP_CURE)) {
				useChip(CHIP_CURE, getLeek());	
			}
			while (getTP()>=getChipCost(CHIP_BANDAGE)) {
				useChip(CHIP_BANDAGE, getLeek());
			}
		}
	}
	//sinon
	else{
		debug("ennemi faible");
		//si le chemin vers l'adversaire est plus court ou egal 5 et que je peux faire une attaque au moins
		if ((getPathLength(getCell(), getCell(ennemi))-getMP()<=getWeaponArea(WEAPON_AXE)) and getTP()>getWeaponCost(WEAPON_AXE)) {
			debug("hache");
			//je prends ma hache si je ne l'ai pas
			if (getWeapon()!=WEAPON_AXE) {
				setWeapon(WEAPON_AXE);
			}
			//j'approche jusqu'à lui
			moveToward(ennemi);
			//je check mes tp
			var TP = getTP();
			while (TP>=getWeaponCost(WEAPON_AXE)) {
				//je frappe
				useWeapon(ennemi);
				TP-=getWeaponCost(WEAPON_AXE);
			}
			//si je peux me soigner
			while (getTP()>=getChipCost(CHIP_BANDAGE)) {
				//je me soigne
				useChip(CHIP_BANDAGE, getLeek());
			}	
		}
		//si en avancant je peux me retrouver à 8 cases de l'ennemi et que je peux faire au moins un tir
		else if ((getCellDistance(getCell(), getCell(ennemi))-getMP()<=getWeaponArea(WEAPON_MAGNUM)) and getTP()>=getWeaponCost(WEAPON_MAGNUM)) {
			if (getWeapon()!=WEAPON_MAGNUM) {
				setWeapon(WEAPON_MAGNUM);
			}
			//j'approche à 8 cases de lui
			while (getCellDistance(getCell(), getCell(ennemi))>getWeaponArea(WEAPON_MAGNUM) and getMP()>=1) {
				moveToward(ennemi,1);
			}
			//je choppe mes tp
			var TP=getTP();
			while (TP>=getWeaponCost(WEAPON_MAGNUM)) {
				//je tire
				useWeapon(ennemi);
				TP-=getWeaponCost(WEAPON_MAGNUM);
			}
			//si jamais il y avait un obstacle j'utilise les flames
			TP=getTP();
			while (TP>=getChipCost(CHIP_SPARK)) {
				//je tire
				useChip(CHIP_SPARK, ennemi);
				TP-=getChipCost(CHIP_SPARK);
			}
			//si je peux me soigner
			while (getTP()>=getChipCost(CHIP_BANDAGE)) {
				//je me soigne
				useChip(CHIP_BANDAGE, getLeek());
			}
		}
	}
	//on met à jour mon arme
	arme=getWeapon();
}
moveAwayFrom(ennemi);

function bulbAI() {
	var protTp = getCooldown(CHIP_PROTEIN);
	var helmTp = getCooldown(CHIP_HELMET);
	var summoner = getSummoner();
	while ((getCellDistance(getCell(), getCell(summoner))>1) and getMP()>=1) {
		moveToward(summoner,1);
	}
	if (protTp == 0) {
		useChip(CHIP_PROTEIN, summoner);
	}
	if (helmTp == 0) {
		useChip(CHIP_HELMET, summoner);
	}
	useChip(CHIP_BANDAGE, summoner);

}