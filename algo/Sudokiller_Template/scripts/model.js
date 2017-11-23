// Here you can add your own code
// Reminder:
// - To refresh ui, call draw() function, board parameter should be a proper 9x9 grid 



var currentGrid; // Your handle on the grid selected, once a grid is selected, you can use this var to get the grid
var numberOfMoves = 0; // This is the place

// This is the function called by the solve button, you can do whatever you want with it, but don't rename it!
function solve() 
{
	console.log("toto");
	var fin = false;
	while (!fin)
	{
		possibilites = testpossib(currentGrid);
		miseajourgrille(currentGrid,possibilites);
		fin = testfin(currentGrid);
	}
	stop();
	draw();
}




function testpossib(currentGrid){
	var possibilites = [];
	for (var i = 0; i < 9; i++) 
	{
		var array = [];
		for (var j = 0; j < 9; j++) 
		{
			array.push([]);
		}
		possibilites.push(array);
	}
	for (var i = 0; i < 9; i++)
	{
		for (var j = 0; j < 9; j++)
		{
			if (currentGrid[i][j] == 0) 
			{
				var ligne = currentGrid[i];
				var colonne = [];
				for (var k = 0; k < 9; k++) 
				{
					colonne.push(currentGrid[k][j]);
				}
				var groupe = [];
				if (i < 3) 
				{
					if (j < 3) 
					{
						for (var k = 0; k < 3; k++) 
						{
							for (var l = 0; l < 3; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 3 && j < 6) 
					{
						for (var k = 0; k < 3; k++) 
						{
							for (var l = 3; l < 6; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 6) 
					{
						for (var k = 0; k < 3; k++) 
						{
							for (var l = 6; l < 9; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
				}
				if (i >= 3 && i < 6) 
				{
					if (j < 3) 
					{
						for (var k = 3; k < 6; k++) 
						{
							for (var l = 0; l < 3; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 3 && j < 6) 
					{
						for (var k = 3; k < 6; k++) 
						{
							for (var l = 3; l < 6; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 6) 
					{
						for (var k = 3; k < 6; k++) 
						{
							for (var l = 6; l < 9; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
				}
				if (i >= 6) 
				{
					if (j < 3) 
					{
						for (var k = 6; k < 9; k++) 
						{
							for (var l = 0; l < 3; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 3 && j < 6) 
					{
						for (var k = 6; k < 9; k++) 
						{
							for (var l = 3; l < 6; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
					if (j >= 6) 
					{
						for (var k = 6; k < 9; k++) 
						{
							for (var l = 6; l < 9; l++) 
							{
								groupe.push(currentGrid[k][l]);
							}
						}
					}
				}

				for (var k = 1; k < 10; k++) 
				{
					if (!ligne.includes(k) && !colonne.includes(k) && !groupe.includes(k)) 
					{
						possibilites[i][j].push(k);
					}
				}
			}
			else 
			{
				possibilites[i][j] = [0];
			}
		}
	}
	return possibilites;
}


function miseajourgrille(currentGrid,possibilites) {
	// console.log(possibilites);
	for (var i = 0; i < possibilites.length; i++) {
		for (var j = 0; j < possibilites[i].length; j++) {
			if (possibilites[i][j].length > 1) {
				for (var k = 0; k < possibilites[i][j].length; k++) {
					var value = possibilites[i][j][k];
					var flag = true;
					for (var l = 0; l < possibilites[i].length; l++) {
						if (possibilites[i][l].includes(value) && l != j) {
							flag = false;
							break;
						}
					}

					if (flag) {
						flag = true;
						for (var c = 0; c < 9; c++) {
						if (possibilites[c][j].includes(value) && c != i) {
								flag = false;
								break;
							}
						}
						if (flag) {
							flag = true;
							var x = i - (i % 3);
							var y = j - (j % 3);

							for (var a = x; a < x + 3; a++) {
								for (var b = y; b < y + 3; b++) {
									if (possibilites[a][b].includes(value) && a != i && b != j) {
										flag = false;
										break;
									}
								}
								if (!flag) {
									break;
								}
							}
						}
					}

					if (flag) {
						//currentGrid[i][j] = value;
						possibilites[i][j]=[value];
					}

				}
			}
		}
	}
	for (var i = 0; i < 9; i++) 
	{
		for (var j = 0; j < 9; j++) 
		{
			if (possibilites[i][j].length <= 1 && possibilites[i][j][0] != 0) 
			{
				currentGrid[i][j] = possibilites[i][j][0];
				possibilites[i][j] = [0];
				numberOfMoves += 1;
			}
		}
	}
}


function testfin(currentGrid){
	var fin = true;
	for (var i = 0; i < 9; i++) {
		for (var j = 0; j < 9; j++) {
			// console.log(currentGrid);
			if (currentGrid[i][j] == 0) {
				fin = false;
				break;
			}
		}
		if (!fin) {
			break;
		}
	}
	return fin;
}