function MatAdj(S,A){
    //console.log(S);
    //console.log(A);
    let mat = new Array();
    //console.log(mat)
    for (let i = 0; i < S.length; i++){
        let ligne = new Array();
        for (let j = 0; j < S.length; j++){
            //console.log(ligne);
            ligne.push(0)
        }
        //console.log(mat);
        mat.push(ligne)
    }
    for (let i = 0; i < A.length; i++){
        mat[A[i][0]-1][A[i][1]-1]=1;
    }
    //console.log(mat);
    return mat;
}

S = new Array(1,2,3,4,5,6,7,8);
A = new Array([1,4],[2,1],[2,5],[2,8],[3,5],[3,7],[4,3],[4,4],[4,7],[5,6],[5,8],[6,2],[7,5],[7,6],[8,1],[8,3],[8,4]);

//console.log(MatAdj(S, A));