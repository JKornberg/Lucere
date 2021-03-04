// Canvas Round Corner Rectangle
function roundRect(ctx, x, y, w, h, radius) {
  var r = x + w;
  var b = y + h;
  ctx.beginPath();
  ctx.strokeStyle = 'rgba(0,0,0,0)';
  ctx.fillStyle = 'rgba(0,0,0,0)';
  ctx.lineWidth = 0;
  ctx.moveTo(x+radius, y);
  ctx.lineTo(r-radius, y);
  ctx.quadraticCurveTo(r, y, r, y+radius);
  ctx.lineTo(r, y+h-radius);
  ctx.quadraticCurveTo(r, b, r-radius, b);
  ctx.lineTo(x+radius, b);
  ctx.quadraticCurveTo(x, b, x, b-radius);
  ctx.lineTo(x, y+radius);
  ctx.quadraticCurveTo(x, y, x+radius, y);
  ctx.fill();
}

// Convert seconds to time format mm:ss
function secondsToTime(s) {
  var date = new Date(null);
  date.setSeconds(s);
  var result = date.toISOString().substr(14, 5);
  return result
}