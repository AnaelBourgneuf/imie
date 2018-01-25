mat = [[0,0,0,0,0,0],[0,0,1,0,0,0],[0,1,0,1,0,0],[1,0,0,0,0,0],[1,0,0,1,0,1],[0,0,0,0,0,0]];

function multMat(mat1, mat2) {
    if (mat1[0].length == mat2.length) {
        mat = new Array();
        for (let i = 0; i < mat1.length; i++) {
            ligne = new Array();
            for (let l = 0; l < mat2[0].length; l++) {
                ligne.push(0);
                for (let jk = 0; jk < mat1[0].length; jk++){
                    ligne[l]+=mat1[i][jk]*mat2[jk][l];
                }
            }
            mat.push(ligne);
        }
        return mat;
    }
    else if (mat2[0].length == mat1.length){
        return multMat(mat2, mat1);
    }
    else {
        return "erreur";
    }
}

//console.log(multMat(mat,mat));