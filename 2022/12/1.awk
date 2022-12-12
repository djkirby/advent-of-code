function abs(n) { return n < 0 ? -n : n }

function neighb(_next) {
  if (!_next) return 0
  v = index("SabcdefghijklmnopqrstuvwxyzE", g[i, j])
  v2 = index("SabcdefghijklmnopqrstuwxyzE", _next)
  # print "    " g[i,j],_next,v,v2,abs(v2-v1)
  return (v == v2 || abs(v2 - v) == 1)
}

# function printAllPathsUtil(a, b, _px,_py,_visited,_lplx,_lply, i, _k) {
#   if (g[a,b] == "E") {
#     print "done"
#     return;
#   }
#    _visited[a,b]=1

#    print "visiting " a, b
#    q++
#    for (i = 1; i <= n[a, b]; i++) {
#      nx = adjX[a, b, i]
#      ny = adjY[a, b, i]

#      if (!_visited[nx,ny]) {
#         _lplx[++_k] = a
#         _lply[_k] = b
#         printAllPathsUtil(nx, ny, _visited, _lplx, _lply)

#         # // store current node in path[]
#         # localPathList.push(adjList[u][i]);
#         # printAllPathsUtil(adjList[u][i], d, isVisited, localPathList);

#         # // remove current node in path[]
#         # localPathList.splice(localPathList.indexOf(adjList[u][i]),1);
#         for (c = 1; c <= _k;c++) {
#           if (_lplx[c] == a && _lply[c] == b) {
#             delete _lplx[c]; 
#             delete _lply[c]; 
#           }
#         }
#      }
#    }
# }

# function printAllPaths(_a,_b) {
#   pathlistX[0] = _a
#   pathlistY[0] = _b
# printAllPathsUtil(_a,_b,pathlistX,pathlistY)
# }

# function traverse(node, path) {
#     if(node === undefined){
#         node = RootNode;
#     }
#     if(path === undefined){
#         path = [];
#     }
#     path.push(node.val);
#     console.log("Current Path", path);
#     if(node.val === 16){
#         console.log("Found Valid", path);
#         validPaths.push(clone(path));
#         return ;
#     }
#     node.childs.forEach(x => {
#         if(path.indexOf(x.val) === -1){
#             var newPath = clone(path);
#             traverse(x, newPath);
#         }
#     });
# }

function traverse(node, path) {
  if (!node) {
    node = g[1,1]
  }
  if (!path) {
    
  }
}

BEGIN {
  FS = ""
}
{
  for (i = 1; i <= NF; i++) {
    g[i, NR] = $i
  }
}
END {
  for (j = 1; j <= NR; j++) {
    for (i = 1; i <= NF; i++) {
      if (!g[i,j]) print "@@@@@@@"
      print "[" i ", " j "]"

      if (neighb(g[i - 1, j])) {
        adjX[i, j, ++n[i,j]] = i - 1 
        adjY[i, j, n[i,j]] = j
        print "    [" i-1 ", " j "]"
      } 
       if (neighb(g[i + 1, j])) {
        adjX[i, j, ++n[i,j]] = i + 1 
        adjY[i, j, n[i,j]] = j
        print "    [" i+1 ", " j "]"
      } 
       if (neighb(g[i, j - 1])) {
        adjX[i, j, ++n[i,j]] = i
        adjY[i, j, n[i,j]] = j - 1
        print "    [" i ", " j-1 "]"
      } 
       if (neighb(g[i, j + 1])) {
        adjX[i, j, ++n[i,j]] = i
        adjY[i, j, n[i,j]] = j + 1
        print "    [" i ", " j+1 "]"
      }

    }
    # print ""
  }

  traverse()

  # printAllPaths(1, 1)
  # print q
}