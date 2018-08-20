

function(myself, grid, bots, gameInfo) {
  function getForce(i, j) {
    let colour = grid[i][j];
    if (colour == 0) 
      return 2;             //overwriting a 0 is the second best outcome
    else if (colour == myself[0])
      return 0;             //going over my own colour does nothing
    else {
      let n = Math.abs(myself[0] - colour) % 3;
      if (n == 0)
        return 3;           //overwriting another bot's colour is the best outcome
      else if (n == 1)
        return 1;           //erasing is third best
      else
        return 0;           //leaving the same colour does nothing
    }
  }

  function getQuadrant(rx, ry) {
      if (ry <= rx && ry < -rx)      // upper quadrant
        return 0;
      else if (ry < rx && ry >= -rx) // right quadrant
        return 1;
      else if (ry >= rx && ry > -rx) // lower quadrant
        return 2;
      else if (ry > rx && ry <= -rx) // left quadrant
        return 3;
  }

  let quadForce = [0, 0, 0, 0]
  for (let x = 0; x < grid.length; x++) {
    let gridrow = grid[x];
    for (let y = 0; y < gridrow.length; y++) {
      let currCellForce = getForce(x, y);
      let relx = x - myself[1], rely = y - myself[2];
      //console.log(relx + ':' + rely)
      currCellForce = currCellForce/(Math.abs(relx) + Math.abs(rely));
      quadForce[getQuadrant(relx, rely)] += currCellForce;
    }
  }

  for (const bot of bots) {
    if (Math.abs(bot[0] - myself[0])%3 == 0 && bot[0] != myself[0]) {
      let relx = bot[1] - myself[1], rely = bot[2] - myself[2];
      quadForce[getQuadrant(relx, rely)] *= 0.75;
    }
  }

  let dirForce = [0, 0, 0, 0];
  for (let dir = 0; dir < 4; dir++) {
    let xdiff = Math.sign(2 - dir) * dir%2;
    let newx  = myself[1] + xdiff;
    if (newx < 0 || newx >= grid.length)
      continue;

    let ydiff = Math.sign(dir - 1) * (1 - dir%2);
    let newy  = myself[2] + ydiff;
    if (newy < 0 || newy >= grid.length)
      continue;

    let newCellForce = Math.max(getForce(newx, newy), 0.5);
    let lastPos = localStorage.getItem('quad_lastpos');
    if (lastPos) {
      lastPos = JSON.parse(lastPos);
      if (lastPos[0] == newx &&lastPos[1] == newy)
        newCellForce *= 0.1;  // make it much less likely to be chosen
    }
    dirForce[dir] = newCellForce * quadForce[dir];
  }

  let bestDir = dirForce.indexOf(Math.max(...dirForce));
  let move = ['up', 'right', 'down', 'left'][bestDir];
  localStorage.setItem('quad_lastpos', JSON.stringify([myself[1], myself[2]]));

  return move;
}

