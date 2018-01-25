function MatAdj(S,A){
    let mat = new Array();
    for (let i = 0; i < S.length; i++){
        let ligne = new Array();
        for (let j = 0; j < S.length; j++){
            ligne.push(0)
        }
        mat.push(ligne)
    }
    for (let i = 0; i < A.length; i++){
        mat[A[i][0]-1][A[i][1]-1]=1;
    }
    return mat;
}



S = new Array(1,2,3,4,5,6,7,8);
A = new Array([1,2],[2,8],[3,1],[3,4],[3,6],[4,8],[5,3],[6,4],[6,7],[6,8],[7,1],[7,2]);

mat = MatAdj(S, A);



function existeArcMat(mat, S1, S2){
    return mat[S1-1][S2-1];
}

//console.log(existeArcMat(mat, 1, 2));

function existeChemin(S, A, c){
    let mat = MatAdj(S, A);
    test = true;
    //console.log(c.length);
    for (let i = 0; i < c.length -1; i++){
        if (existeArcMat(mat, c[i], c[i+1]) != 1 ){
            test = false;
        }
        //console.log(test);
    }
    return test;
}

console.log(existeChemin(S, A, [5, 3, 1, 2, 8]))