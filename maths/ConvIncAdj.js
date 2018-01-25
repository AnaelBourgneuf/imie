function Conv(MatInc){
    MatAdj = new Array();
    for (let i = 0; i < MatInc.length; i++){
        let ligne = new Array();
        for (let j = 0; j < MatInc.length; j++){
            ligne.push(0);
        }
        MatAdj.push(ligne);
    }

    for (j = 0; j < MatInc[0].length; j++){
        couple=[0,0];
        for (i = 0; i < MatInc.length; i++){
            if (MatInc[i][j] == 1){
                couple[0]=i;
            }
            if (MatInc[i][j] == -1){
                couple[1]=i;
            }
        }
        MatAdj[couple[0]][couple[1]]=1;
    }
    return MatAdj;
}

mat=[[1,-1,-1,1,0],[0,0,0,-1,1],[0,0,1,0,-1],[-1,1,0,0,0]];

//console.log(Conv(mat));