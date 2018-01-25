function MatInc(S, A){
    //console.log(S);
    //console.log(A);
    let mat = new Array();
    mat.push(A)
    //console.log(mat)
    for (let i = 0; i < S.length; i++){
        let ligne = new Array();
        for (let j = 0; j < A.length; j++){
            //console.log(ligne);
            ligne.push(0)
        }
        //console.log(mat);
        mat.push(ligne)
    }
    for (let i = 0; i < A.length ; i++){
        mat[mat[0][i][0]][i]=1;
        mat[mat[0][i][1]][i]=-1;
    }
    //console.log(mat);
    return mat;
}

S = new Array(1,2,3,4,5,6,7,8);
A = new Array([1,2],[2,8],[3,1],[3,4],[3,6],[4,8],[5,3],[6,4],[6,7],[6,8],[7,1],[7,2]);

//console.log(MatInc(S, A));