const handType = {
  HOURS: 1,
  MINUTES: 2,
  SECONDS: 3
};

class ClockHand {
  constructor(ctx, clockRadius, handType) {
    this.ctx = ctx;
    this.clockRadius = clockRadius;
    this.handType = handType;
  }

  drawHand() {
    var handLength;
    var time;
    var radians;
    var width;
    var now = new Date();
    Math.TAU = Math.PI * 2;

    switch (this.handType) {
      case handType.HOURS:
        handLength = this.clockRadius * 0.7;
        time = now.getHours();
        radians = Math.TAU * (time / 12);
        width = 6.5;
        break;
      case handType.MINUTES:
        handLength = this.clockRadius * 0.89;
        time = now.getMinutes();
        radians = Math.TAU * (time / 60);
        width = 3;
        break;
      case handType.SECONDS:
        handLength = this.clockRadius;
        time = now.getSeconds();
        radians = Math.TAU * (time / 60);
        width = 1.5;
        break;
    }

    var targetX = Math.cos(radians - Math.TAU / 4) * handLength;
    var targetY = Math.sin(radians - Math.TAU / 4) * handLength;

    this.ctx.strokeStyle = "#677E0F";
    this.ctx.beginPath();
    this.ctx.moveTo(0, 0);
    this.ctx.lineWidth = width;
    this.ctx.lineTo(targetX, targetY);
    this.ctx.stroke();
  }
}

function drawClock(canvas) {
  var context = canvas.getContext("2d");
  var radius = canvas.height / 2;
  context.translate(radius, radius);
  drawTicks(context, radius);
  drawHands(context, radius);
  makeDonut(context, radius, canvas.height, canvas.width);
}

function clearClock(canvas) {
  var ctx = canvas.getContext("2d");
  ctx.clearRect(0, 0, canvas.height, canvas.width);
}

function makeDonut(ctx, radius, height, width) {
  ctx.save();
  ctx.beginPath();
  ctx.arc(0, 0, radius * 0.1, 0, 2 * Math.PI);
  ctx.clip();
  ctx.translate(-(width / 2), -(height / 2));
  ctx.clearRect(0, 0, height, width);
  ctx.restore();
  ctx.translate(-(width / 2), -(height / 2));
}

function drawHands(ctx, radius) {
  var hourHand = new ClockHand(ctx, radius, handType.HOURS);
  var minHand = new ClockHand(ctx, radius, handType.MINUTES);
  var secHand = new ClockHand(ctx, radius, handType.SECONDS);

  hourHand.drawHand();
  minHand.drawHand();
  secHand.drawHand();
}

function drawTicks(ctx, radius) {
  Math.TAU = Math.PI * 2;
  var radians;
  var startX;
  var startY;
  var endX;
  var endY;

  ctx.strokeStyle = "#E0D868";
  ctx.lineWidth = 3;

  for (var hour = 0; hour < 13; hour++) {
    radians = Math.TAU * (hour / 12);
    endX = Math.cos(radians - Math.TAU / 4) * radius;
    endY = Math.sin(radians - Math.TAU / 4) * radius;

    startX = Math.cos(radians - Math.TAU / 4) * radius * 0.9;
    startY = Math.sin(radians - Math.TAU / 4) * radius * 0.9;

    ctx.beginPath();
    ctx.moveTo(startX, startY);
    ctx.lineTo(endX, endY);
    ctx.stroke();
  }
}

