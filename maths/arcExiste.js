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

function liAdj(S, A){
    let liste = new Array();
    for (let i = 0; i < S.length; i++){
        liste.push([]);
    }
    for (let i = 0; i < A.length; i++){
        liste[A[i][0]-1].push(A[i][1]);
    }
    return liste;
}


S = new Array(1,2,3,4,5,6,7,8);
A = new Array([1,2],[2,8],[3,1],[3,4],[3,6],[4,8],[5,3],[6,4],[6,7],[6,8],[7,1],[7,2]);

mat = MatAdj(S, A);
listAdj = liAdj(S, A);



function existeArcMat(mat, S1, S2){
    return mat[S1-1][S2-1];
}

//console.log(existeArcMat(mat, 1, 2));

function existeArcListe(li, S1 ,S2){
    for (let i = 0; i < li.length; i++){
        if (li[i][0] == S1 && li[i][1] == S2){
            return 1;
        }
    }
    return 0;
}

//console.log(existeArcListe(listAdj, 1, 2));
