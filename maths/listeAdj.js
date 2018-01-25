function liAdj(S, A){
    //console.log(S);
    //console.log(A);
    let liste = new Array();
    //console.log(mat)
    for (let i = 0; i < S.length; i++){
        liste.push([]);
    }
    for (let i = 0; i < A.length; i++){
        liste[A[i][0]-1].push(A[i][1]);
    }
    //console.log(mat);
    return liste;
}

S = new Array(1,2,3,4,5,6,7,8);
A = new Array([1,2],[2,8],[3,1],[3,4],[3,6],[4,8],[5,3],[6,4],[6,7],[6,8],[7,1],[7,2]);

//console.log(liAdj(S, A));