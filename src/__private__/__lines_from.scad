function __lines_from(pts, closed = false) = 
    let(leng = len(pts))
    concat(
        [for(i = 0; i < leng - 1; i = i + 1) [pts[i], pts[i + 1]]], 
        closed ? [[pts[len(pts) - 1], pts[0]]] : []
    );
    